// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_state.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/cubit/comment_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/cubit/history_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/done_button_widget.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/widgets/footer_load_more_widget.dart';
import 'package:mat_practice_pte/src/widgets/loading_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../widgets/dimentions/f_sizeboxs.dart';
import 'discuss/cubit/discuss_cubit.dart';
import 'discuss/ui/discuss_component_widget.dart';
import 'lesson_answer_widget.dart';
import 'lesson_app_bar.dart';
import 'lesson_bottom_navigation_bar.dart';

class LessonScaffold extends StatefulWidget {
  final Widget child;
  const LessonScaffold({
    Key? key,
    required this.child,
    this.isQNumDescending,
    this.filterMark,
    this.filterPracticed,
    required this.initIdLesson,
    required this.initIndex,
    required this.idCategory,
  }) : super(key: key);
  final bool? isQNumDescending;
  final FilterMarkEnum? filterMark;
  final FilterPracticedEnum? filterPracticed;
  final String initIdLesson;
  final int initIndex;
  final String idCategory;

  @override
  State<LessonScaffold> createState() => _LessonScaffoldState();
}

class _LessonScaffoldState extends State<LessonScaffold>
    with TickerProviderStateMixin {
  late TabController _tabBarController;
  @override
  Widget build(BuildContext context) {
    _tabBarController = TabController(length: 2, vsync: this);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LessonCubit(
              idCategory: widget.idCategory,
              filterMark: widget.filterMark,
              initIdLesson: widget.initIdLesson,
              initIndex: widget.initIndex,
              isQNumDescending: widget.isQNumDescending,
              filterPracticed: widget.filterPracticed)
            ..initCubit(),
        ),
        BlocProvider(create: (context) => DiscussCubit(_tabBarController)),
        BlocProvider(
            create: (context) => HistoryCubit(
                controller: context.read<LessonCubit>().refreshController,
                idCategory: widget.idCategory)),
        BlocProvider(
            create: (context) => CommentCubit(
                controller: context.read<LessonCubit>().refreshController,
                idCategory: widget.idCategory)),
      ],
      child: Scaffold(
          backgroundColor: AppColors.colorGreyBackground,
          body: Stack(
            children: [
              Builder(builder: (context) {
                return SmartRefresher(
                  controller: context.read<LessonCubit>().refreshController,
                  scrollController:
                      context.read<LessonCubit>().scrollController,
                  onLoading: () =>
                      context.read<DiscussCubit>().scrollOnLoading(context),
                  enablePullUp: true,
                  enablePullDown: false,
                  footer: const FooterLoadMoreWidget(),
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          // horizontal: 10,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    titleCodeWidget(),
                                    FSizeBoxs.h10,
                                    widget.child,
                                    FSizeBoxs.h10,
                                  ]),
                            ),
                            LessonAnswerWidget(
                                key:
                                    context.read<LessonCubit>().answerPosition),
                            FSizeBoxs.h10,
                            DiscussComponentWidget(
                              controller:
                                  context.read<LessonCubit>().refreshController,
                            ),
                          ],
                        )),
                  ),
                );
              }),
              BlocBuilder<LessonCubit, LessonState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading,
                builder: (context, state) {
                  if (state.isLoading) return const LoadingWidget();
                  return Container();
                },
              )
            ],
          ),
          appBar: LessonAppBar(codeCategory: widget.idCategory),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const DoneButtonWidget(),
          bottomNavigationBar: const LessonBottomNavigationBar()),
    );
  }

  Widget titleCodeWidget() {
    return BlocBuilder<LessonCubit, LessonState>(
      builder: (context, state) {
        if (state.currentLesson == null) return Container();
        final codeLesson = state.currentLesson!.codeLesson;
        final title = state.currentLesson!.title;
        return Text('#$codeLesson $title',
            style: AppTextStyles.body2.copyWith(color: AppColors.grey));
      },
    );
  }
}
