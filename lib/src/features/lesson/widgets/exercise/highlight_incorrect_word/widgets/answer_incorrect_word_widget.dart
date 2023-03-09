import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';

class AnswerIncorrectWordWidget extends StatelessWidget {
  const AnswerIncorrectWordWidget({Key? key, required this.answer})
      : super(key: key);
  final String answer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FCoordinator.showDefinition(answer),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Text(
          '(Correct: $answer)',
          style: AppTextStyles.body1
              .copyWith(fontSize: 18, color: AppColors.colorPrimary),
        ),
      ),
    );
  }
}
