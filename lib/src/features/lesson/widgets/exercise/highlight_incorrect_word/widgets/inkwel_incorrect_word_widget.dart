import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

class InkwellHighlightWordWidget extends StatelessWidget {
  const InkwellHighlightWordWidget(
      {Key? key,
      required this.text,
      this.onTap,
      required this.isDone,
      required this.isAnswer,
      required this.isSelected})
      : super(key: key);
  final String text;
  final bool isSelected;
  final bool isAnswer;
  final bool isDone;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final Color? color = isDone
        ? isSelected
            ? isAnswer
                ? AppColors.green
                : AppColors.red
            : isAnswer
                ? AppColors.colorPrimary
                : null
        : isSelected
            ? AppColors.colorPrimary
            : null;
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: isAnswer ? AppColors.red : null,
            color: color,
          ),
          child: Text(
            text,
            style: AppTextStyles.body1.copyWith(fontSize: 18),
          )),
    );
  }
}
