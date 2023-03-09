import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/cubit/history_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_history.dart';
import 'package:mat_practice_pte/src/utils/helpers/helpers.dart';
import 'package:mat_practice_pte/src/utils/helpers/word_extentions.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';

class LessonHistoryWidget extends StatelessWidget {
  const LessonHistoryWidget({super.key, required this.history});
  final LessonHistory history;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: FPaddingSizes.s20, vertical: FPaddingSizes.s20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(Helpers.parseTimeStampToStr(history.timeCreated),
                    style: AppTextStyles.body1.copyWith(color: AppColors.grey)),
                const Spacer(),
                InkWell(
                  onTap: () => context
                      .read<HistoryCubit>()
                      .removeHistoryLessonOnClick(context, history.id!),
                  child: const Icon(
                    AppIcons.iconDelete,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            FSizeBoxs.h10,
            Text(
              'Score: ${history.myScore}/${history.maxScore}',
              style: AppTextStyles.body1,
            ),
            WordExtension.answersToTextSpan(history.answers),
          ]),
        ),
        const Divider(),
      ],
    );
  }
}
