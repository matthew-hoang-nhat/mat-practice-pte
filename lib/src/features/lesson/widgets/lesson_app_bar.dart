// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';

import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_state.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';

class LessonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LessonAppBar({
    Key? key,
    required this.codeCategory,
  }) : super(key: key);
  final String codeCategory;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      buildWhen: (previous, current) =>
          previous.currentLesson != current.currentLesson ||
          previous.maxIndex != current.maxIndex ||
          previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        final String? codeLesson = state.currentLesson?.codeLesson;
        final String? title = state.currentLesson?.title;
        return AppBar(
          title: codeLesson != null ? Text('#$codeLesson $title') : Container(),
          leadingWidth: 100,
          centerTitle: true,
          leading: Row(
            children: [
              const InkWell(
                onTap: FCoordinator.onBack,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(CommunityMaterialIcons.chevron_left, size: 30),
                ),
              ),
              if (state.maxIndex != null)
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: '${state.currentIndex + 1}'),
                  TextSpan(text: '/${state.maxIndex}'),
                ]))
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: DropdownButton<String?>(
                value: state.currentLesson?.mark,
                items: [
                  DropdownMenuItem(
                      value: FilterMarkEnum.red.toString(),
                      child:
                          const Icon(AppIcons.iconMark, color: AppColors.red)),
                  DropdownMenuItem(
                      value: FilterMarkEnum.grey.toString(),
                      child:
                          const Icon(AppIcons.iconMark, color: AppColors.grey)),
                  const DropdownMenuItem(
                      value: null,
                      child: Icon(AppIcons.iconMarkOutline,
                          color: AppColors.grey)),
                ],
                icon: const Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                onChanged: context.read<LessonCubit>().markOnClick,
              ),
            )
          ],
        );
      },
    );
  }
}
