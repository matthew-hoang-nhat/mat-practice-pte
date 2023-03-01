// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

class ReOrderCardWidget extends StatelessWidget {
  const ReOrderCardWidget({
    Key? key,
    required this.index,
    required this.content,
  }) : super(key: key);
  final int index;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
      ),
      child: Text('$index. $content', style: AppTextStyles.body1),
    );
  }
}
