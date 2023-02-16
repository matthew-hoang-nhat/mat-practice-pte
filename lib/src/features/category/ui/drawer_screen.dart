// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/app/cubit/app_cubit.dart';
import 'package:mat_practice_pte/src/features/category/cubit/drawer_cubit.dart';
import 'package:mat_practice_pte/src/features/category/widgets/category_drawer_widget.dart';
import 'package:mat_practice_pte/src/features/category/widgets/triangle_painter.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson_repository.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/utils/helpers/helpers.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/loading_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
    required this.idCategory,
  }) : super(key: key);
  final String idCategory;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(idCategory: idCategory)..initCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          actions: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(AppIcons.iconSearchOutline, size: 30))
          ],
        ),
        body: SafeArea(
            child: BlocBuilder<DrawerCubit, DrawerState>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            return Stack(
              children: [
                SmartRefresher(
                  controller: context.read<DrawerCubit>().refreshController,
                  onRefresh: context.read<DrawerCubit>().onRefresh,
                  onLoading: context.read<DrawerCubit>().onLoading,
                  enablePullDown: true,
                  enablePullUp: true,
                  // header: const WaterDropHeader(),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus? mode) {
                      Widget body;
                      switch (mode) {
                        case LoadStatus.idle:
                          body = Container();
                          break;
                        case LoadStatus.loading:
                          body = const CircularProgressIndicator();
                          break;
                        case LoadStatus.canLoading:
                          body = Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(CommunityMaterialIcons.arrow_up),
                              Text('Release to load more'),
                            ],
                          );
                          break;

                        default:
                          body = Container();
                      }
                      return SizedBox(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        topInfoComponent(context),
                        BlocBuilder<DrawerCubit, DrawerState>(
                          builder: (context, state) {
                            return Column(
                                children: List.generate(
                                    state.lessons.length,
                                    (index) => itemLessonWidget(
                                        index + 1, state.lessons[index])));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<DrawerCubit, DrawerState>(
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const LoadingWidget();
                    }
                    return Container();
                  },
                )
              ],
            );
          },
        )),
      ),
    );
  }

  Widget topInfoComponent(context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<DrawerCubit, DrawerState>(
          builder: (context, state) {
            final hexCode = appState.categories
                .where((element) => element.id == state.idCategory)
                .first
                .hexCodeColor;
            Color itemColor = Helpers.fromStrHex(hexCode);

            final codeName = state.category?.codeName ?? '';
            final nameCategory = state.category?.name ?? '';
            final foundLesson = state.category?.foundLesson ?? 12;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: itemColor),
                            alignment: Alignment.center,
                            child: Text(
                              codeName,
                              style: AppTextStyles.headline5
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                          FSizeBoxs.w20,
                          Expanded(
                            child: Text(nameCategory,
                                style:
                                    AppTextStyles.body1.copyWith(fontSize: 18)),
                          ),
                          Container(
                              height: 30,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(FPaddingSizes.s100),
                                    bottomLeft:
                                        Radius.circular(FPaddingSizes.s100),
                                  ),
                                  color: AppColors.red),
                              alignment: Alignment.center,
                              child: Text(
                                'Guide',
                                style: AppTextStyles.body2.copyWith(
                                  color: AppColors.white,
                                ),
                              ))
                        ],
                      ),
                      FSizeBoxs.h20,
                      Row(
                        children: [
                          Text(
                            'Found $foundLesson Questions',
                            style: AppTextStyles.labelMedium,
                          ),
                          const Spacer(),
                          BlocBuilder<DrawerCubit, DrawerState>(
                            buildWhen: (previous, current) =>
                                previous.isIdDescending !=
                                current.isIdDescending,
                            builder: (context, state) {
                              final iconNewOnClick = state.isIdDescending;
                              return InkWell(
                                onTap: () => context
                                    .read<DrawerCubit>()
                                    .iconNewOnClick(context),
                                child: Row(
                                  children: [
                                    Text(iconNewOnClick ? 'Oldest ' : 'Latest',
                                        style: AppTextStyles.labelMedium
                                            .copyWith(
                                                color: AppColors.colorPrimary)),
                                    Icon(
                                        iconNewOnClick == true
                                            ? AppIcons.iconSortAsc
                                            : AppIcons.iconSortDes,
                                        color: AppColors.colorPrimary,
                                        size: 20),
                                  ],
                                ),
                              );
                            },
                          ),
                          FSizeBoxs.w20,
                          InkWell(
                            onTap: () {
                              SmartDialog.show(
                                alignment: Alignment.centerRight,
                                builder: (dialogContext) {
                                  return BlocProvider.value(
                                    value: context.read<DrawerCubit>(),
                                    child: Container(
                                      height: double.infinity,
                                      width: 300,
                                      color: AppColors.white,
                                      child: const CategoryDrawerWidget(),
                                    ),
                                  );
                                },
                              );
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Text('Filter',
                                      style: AppTextStyles.labelMedium),
                                  const Icon(AppIcons.iconFilterOutline,
                                      color: AppColors.grey, size: 20),
                                ],
                              ),
                            ),
                          ),
                          FSizeBoxs.w10,
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          },
        );
      },
    );
  }

  Widget itemLessonWidget(int index, DetailLesson lesson) {
    final markStr = lesson.mark;
    Color? markColor;
    FilterMarkEnum? mark;

    if (markStr != null) {
      mark = FilterMarkEnum.tryParse(markStr);
      switch (mark) {
        case FilterMarkEnum.red:
          markColor = AppColors.red;
          break;
        case FilterMarkEnum.grey:
          markColor = AppColors.grey;
          break;
        default:
      }
    }

    final countPracticed = lesson.countPracticed ?? 0;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: FPaddingSizes.s20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: FPaddingSizes.s50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$index. ${lesson.title}',
                          style: AppTextStyles.body1.copyWith(
                            color: AppColors.colorTextColor,
                            fontSize: 18,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Practice * $countPracticed',
                            style: AppTextStyles.labelMedium,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.grey),
                            child: Text(
                              '#${lesson.codeLesson}',
                              style: AppTextStyles.body2
                                  .copyWith(color: AppColors.white),
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
              const Divider(),
            ],
          ),
        ),
        if (markColor != null)
          CustomPaint(
            painter: TrianglePainter(backgroundColor: markColor),
            size: const Size(30, 30),
          ),
      ],
    );
  }
}
