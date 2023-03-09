import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/word_definition/ui/word_inkwell.dart';
import '../cubit/lesson_state.dart';

class LessonAnswerWidget extends StatelessWidget {
  const LessonAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      buildWhen: (previous, current) =>
          previous.currentLesson != current.currentLesson ||
          previous.isShowAnswer != current.isShowAnswer,
      builder: (context, state) {
        if (state.currentLesson == null) return Container();
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Switch.adaptive(
                    value: state.isShowAnswer,
                    onChanged: context.read<LessonCubit>().setIsShowAnswer),
                const Text('Answer'),
              ],
            ),
            if (state.isShowAnswer)
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  color: AppColors.whiteGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Answer:',
                        style: AppTextStyles.body1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      RichText(
                          text: TextSpan(
                              children:
                                  state.currentLesson?.questionGroup.questions
                                      .map((e) => e.answer
                                          .map((e) => WidgetSpan(
                                                child: WordInkwell(
                                                  text: e,
                                                ),
                                              ))
                                          .toList())
                                      .expand((element) => element)
                                      .toList()))
                    ],
                  )),
          ]),
        );
      },
    );
  }
}
