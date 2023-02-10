import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/widgets/bottom_modal_sheet/f_bottom_modal_sheet.dart';

import 'package:mat_practice_pte/src/widgets/f_button/f_button.dart';
import 'package:mat_practice_pte/src/widgets/f_checkbox/f_checkbox.dart';
import 'package:mat_practice_pte/src/widgets/f_textfield/f_textfield.dart';

enum FToastType {
  warning,
  error,
  information,
}

class AndroidFApp extends FApp {
  @override
  FButton button(
      {required Function() onClick,
      required String title,
      Widget? suffixIcon}) {
    return RectangleFButton(
        onClick: onClick, title: title, suffixIcon: suffixIcon);
  }

  @override
  FTextField textField(
      {required Function(String) onChanged,
      String? hintText,
      required TextEditingController controller,
      bool? isObscureText}) {
    return RoundFTextField(
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      isObscureText: isObscureText ?? false,
    );
  }

  @override
  showAlertDialog(
    context, {
    required String title,
    required String body,
    required List<Map<String, Function()>> actions,
    required Map<String, Function()> redAction,
  }) {
    showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
              alignment: Alignment.center,
              actionsAlignment: MainAxisAlignment.center,
              title: Center(
                  child: Text(
                title,
                style: AppTextStyles.headline6
                    .copyWith(color: AppColors.colorPrimary),
              )),
              content: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [Text(body)],
              ),
              actions: [
                if (redAction.isNotEmpty)
                  TextButton(
                      onPressed: () {
                        redAction.values.first();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        redAction.keys.first,
                        style: AppTextStyles.body2.copyWith(
                            color: AppColors.red, fontWeight: FontWeight.bold),
                      )),
                ...actions
                    .map((e) => TextButton(
                          onPressed: () {
                            e.values.first();
                            Navigator.of(context).pop();
                          },
                          child: Text(e.keys.first),
                        ))
                    .toList(),
              ]);
        });
  }

  @override
  showFDialog(
    context, {
    required String title,
    required String body,
  }) {
    showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: Center(child: Text(title)),
            content: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(body),
              ],
            ),
          );
        });
  }

  @override
  showToast(String msg, {FToastType type = FToastType.information}) {
    switch (type) {
      case FToastType.information:
        SmartDialog.showToast(msg);
        break;
      case FToastType.error:
      case FToastType.warning:
        SmartDialog.showToast('${msg}aaa');
        break;
      default:
    }
  }

  @override
  FCheckBox checkbox({bool? value, required Function(bool?) onChanged}) =>
      RoundFCheckBox(onChanged: onChanged, value: value);

  @override
  showBottomModalSheet(context,
          {required String title,
          required Widget widget,
          Widget? action,
          double? sizeHeight}) =>
      FBottomModalSheet.showMeModalBottomSheet(context,
          title: title, widget: widget, action: action);

  @override
  FButton outlineButton(
      {required Function() onClick,
      required String title,
      Color? foregoundColor,
      Color? backgroundColor,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return OutlineFButton(
        onClick: onClick,
        title: title,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        backgroundColor: backgroundColor,
        foregoundColor: foregoundColor);
  }
}

abstract class FAppShows {
  showBottomModalSheet(context,
      {required String title,
      required Widget widget,
      double? sizeHeight,
      Widget? action});
  showFDialog(
    context, {
    required String title,
    required String body,
  });
  showAlertDialog(
    context, {
    required String title,
    required String body,
    required List<Map<String, Function()>> actions,
    required Map<String, Function()> redAction,
  });
  showToast(String msg, {FToastType type = FToastType.information});
}

abstract class FAppWidgets {
  FButton button(
      {required Function() onClick, required String title, Widget? suffixIcon});
  FButton outlineButton(
      {required Function() onClick,
      required String title,
      Color? foregoundColor,
      Color? backgroundColor,
      Widget? suffixIcon,
      Widget? prefixIcon});
  FTextField textField(
      {required Function(String) onChanged,
      String? hintText,
      required TextEditingController controller,
      bool? isObscureText});
  FCheckBox checkbox({bool? value, required Function(bool?) onChanged});
}

abstract class FApp implements FAppShows, FAppWidgets {}
