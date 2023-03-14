import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

import '../cubit/lesson_cubit.dart';
import '../cubit/lesson_state.dart';

class DoneButtonWidget extends StatelessWidget {
  const DoneButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      buildWhen: (previous, current) =>
          previous.isDone != current.isDone ||
          previous.currentLesson != current.currentLesson,
      builder: (context, state) {
        if (state.currentLesson == null) return Container();
        return InkWell(
          onTap: () {
            if (state.isDone) {
              context.read<LessonCubit>().redoOnClick();
            } else {
              context.read<LessonCubit>().doneOnCLick();
            }
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.colorPrimary,
            ),
            alignment: Alignment.center,
            child: Text(
              state.isDone == false ? 'Done' : 'Re-Do',
              style: AppTextStyles.body1.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
