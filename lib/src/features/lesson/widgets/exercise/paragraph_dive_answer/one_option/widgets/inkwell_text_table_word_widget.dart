// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

class InkwellTextTableWordWidget extends StatelessWidget {
  const InkwellTextTableWordWidget({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.colorPrimary,
      splashColor: AppColors.colorPrimary,
      focusColor: AppColors.colorPrimary,
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            // color: isSelected ? AppColors.grey : null,
            border:
                Border.all(color: isSelected ? Colors.grey : AppColors.black)),
        child: Text(
          text,
          style: AppTextStyles.body1.copyWith(
            fontSize: 18,
            color: isSelected ? AppColors.grey : AppColors.black,
          ),
        ),
      ),
    );
  }
}
