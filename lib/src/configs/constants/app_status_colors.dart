import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class AppStatusColors {
  static const _trueSelected = AppColors.green;
  static const _falseSelected = AppColors.red;
  static const _onlySelected = AppColors.colorPrimary;

  static Color toColor({required bool isAnswer, required bool isDone}) {
    switch (isDone) {
      case true:
        return isAnswer ? _trueSelected : _falseSelected;
      case false:
      default:
        return _onlySelected;
    }
  }
}
