import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class FCardColors {
  static Color _colorDone(
      {required bool isTrueChoice, required bool isSelected}) {
    if (isTrueChoice == true && isSelected) {
      return Colors.green;
    }
    if (isTrueChoice == false && isSelected) {
      return AppColors.red;
    }

    if (isTrueChoice == true && isSelected == false) {
      return AppColors.grey;
    }
    return AppColors.white;
  }

  static Color _notDoneColor(
      {required bool isTrueChoice, required bool isSelected}) {
    if (isSelected) {
      return AppColors.colorPrimary;
    }

    return Colors.white;
  }

  static Color backgroundColor(
      {required bool isDone,
      required bool isAnswer,
      required bool isSelected}) {
    if (isDone) {
      return _colorDone(isSelected: isSelected, isTrueChoice: isAnswer);
    }
    return _notDoneColor(isTrueChoice: isAnswer, isSelected: isSelected);

    // switch (state) {
    //   // case FCardStates.haveSelectInQuestion:
    //   //   return AppColors.colorPrimary;
    //   case FCardStates.notSelectedInQuestion:
    //     return AppColors.white;
    //   // case FCardStates.falseHaveSelectInAnswer:
    //   //   return AppColors.red;
    //   // case FCardStates.trueHaveSelectInAnswer:
    //   //   return AppColors.green;
    //   case FCardStates.trueNotSelectInAnswer:
    //     return AppColors.grey;
    //   // case FCardStates.nothingInAnswer:
    //   // default:
    //   //   return AppColors.white;
    // }
  }

  // static Color backgroundColor(FCardStates state) {
  //   switch (state) {
  //     case FCardStates.haveSelectInQuestion:
  //       return AppColors.colorPrimary;
  //     case FCardStates.notSelectedInQuestion:
  //       return AppColors.white;
  //     case FCardStates.falseHaveSelectInAnswer:
  //       return AppColors.red;
  //     case FCardStates.trueHaveSelectInAnswer:
  //       return AppColors.green;
  //     case FCardStates.trueNotSelectInAnswer:
  //       return AppColors.green;
  //     case FCardStates.nothingInAnswer:
  //     default:
  //       return AppColors.white;
  //   }
  // }
}
