// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

class ScoreBottomNavigationWidget extends StatelessWidget {
  const ScoreBottomNavigationWidget({
    Key? key,
    required this.onCancel,
    required this.myScore,
    required this.total,
    required this.title,
  }) : super(key: key);
  final Function() onCancel;
  final String title;
  final int myScore;
  final int total;
  @override
  Widget build(BuildContext context) {
    final fWidgets = GlobalVariables.getIt<FApp>();
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FSizeBoxs.h10,
          Text(
            'Lesson: $title',
            style: AppTextStyles.headline6
                .copyWith(color: AppColors.colorTextColor),
          ),
          FSizeBoxs.h20,
          Container(
            width: 200,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.grey),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: LinearProgressIndicator(
                  minHeight: 10,
                  color: AppColors.blue,
                  backgroundColor: AppColors.white,
                  // value: myScore / maxScore,
                  value: myScore / total),
            ),
          ),
          FSizeBoxs.h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Choice', style: AppTextStyles.body1),
                  FSizeBoxs.h20,
                  Text(
                    'Total',
                    style: AppTextStyles.body1,
                  ),
                ],
              ),
              FSizeBoxs.w10,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$myScore.0/$total',
                    style: AppTextStyles.body1,
                  ),
                  FSizeBoxs.h20,
                  Text(
                    '$myScore.0/$total',
                    style: AppTextStyles.body1,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: fWidgets.button(onClick: onCancel, title: 'Got it')),
        ],
      ),
    );
  }
}
