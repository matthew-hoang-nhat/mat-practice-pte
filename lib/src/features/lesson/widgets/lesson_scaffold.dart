// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_state.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/done_button_widget.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/loading_widget.dart';

import 'lesson_answer_widget.dart';
import 'lesson_app_bar.dart';
import 'lesson_bottom_navigation_bar.dart';

class LessonScaffold extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonCubit(
          idCategory: idCategory,
          filterMark: filterMark,
          initIdLesson: initIdLesson,
          initIndex: initIndex,
          isQNumDescending: isQNumDescending,
          filterPracticed: filterPracticed)
        ..initCubit(),
      child: Scaffold(
          backgroundColor: AppColors.colorGreyBackground,
          body: Stack(
            children: [
              Builder(builder: (context) {
                return SingleChildScrollView(
                  controller: context.read<LessonCubit>().scrollController,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleCodeWidget(),
                          FSizeBoxs.h10,
                          child,
                          FSizeBoxs.h10,
                          const LessonAnswerWidget(),
                        ],
                      )),
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
          appBar: LessonAppBar(codeCategory: idCategory),
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
