import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/enum/card_color.dart';

class FCardWidget extends StatelessWidget {
  const FCardWidget(
      {super.key,
      required this.isDone,
      required this.isAnswer,
      required this.isSelected,
      required this.content,
      required this.index});
  final bool isDone;
  final bool isAnswer;
  final bool isSelected;
  final String content;
  final int index;
  @override
  Widget build(BuildContext context) {
    final String indexAphabel = String.fromCharCode(65 + index);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: FCardColors.backgroundColor(
            isDone: isDone, isAnswer: isAnswer, isSelected: isSelected),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.grey),
      ),
      child: Text('$indexAphabel. $content', style: AppTextStyles.body1),
    );
  }
}
