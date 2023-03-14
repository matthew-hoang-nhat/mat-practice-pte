import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/cubit/comment_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../cubit/lesson_state.dart';
import 'comment_widget.dart';

class CommentTabWidget extends StatelessWidget {
  const CommentTabWidget({super.key, required this.controller});
  final RefreshController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LessonCubit, LessonState>(
          buildWhen: (previous, current) =>
              previous.currentLesson != current.currentLesson,
          builder: (context, state) {
            return InkWell(
              onTap: () {
                FCoordinator.showAddComment(
                    idCategory: state.idCategory,
                    idLesson: state.currentLesson!.id,
                    onSuccess: context.read<CommentCubit>().refreshDiscusses);
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.colorPrimary)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(AppIcons.iconPencil,
                          color: AppColors.colorPrimary),
                      Text(
                        GlobalVariables.getIt<FLocate>()
                            .str(FLocalKey.iWannaSay),
                        style: AppTextStyles.body1
                            .copyWith(color: AppColors.colorPrimary),
                      ),
                    ],
                  )),
            );
          },
        ),
        BlocBuilder<CommentCubit, CommentState>(
          buildWhen: (previous, current) =>
              previous.lessonDiscusses != current.lessonDiscusses,
          builder: (context, state) {
            return Column(
                children: state.lessonDiscusses
                    .map((e) => CommentWidget(discuss: e))
                    .toList());
          },
        ),
      ],
    );
  }
}
