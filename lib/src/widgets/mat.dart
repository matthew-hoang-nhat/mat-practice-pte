import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/widgets/bottom_modal_sheet/ma_bottom_modal_sheet.dart';
import 'package:mat_practice_pte/src/widgets/ma_button/ma_button.dart';
import 'package:mat_practice_pte/src/widgets/ma_checkbox/ma_checkbox.dart';
import 'package:mat_practice_pte/src/widgets/ma_textfield/ma_textfield.dart';

enum MaToastType {
  warning,
  error,
  information,
}

class AndroidMatApp extends MatApp {
  @override
  MaButton button(
      {required Function() onClick,
      required String title,
      Widget? suffixIcon}) {
    return RectangleButton(
        onClick: onClick, title: title, suffixIcon: suffixIcon);
  }

  @override
  MaTextField textField(
      {required Function(String) onChanged,
      String? hintText,
      required TextEditingController controller,
      bool? isObscureText}) {
    return RoundMaTextField(
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
  showMaDialog(
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
  showToast(String msg, {MaToastType type = MaToastType.information}) {
    switch (type) {
      case MaToastType.information:
        SmartDialog.showToast(msg);
        break;
      case MaToastType.error:
      case MaToastType.warning:
        SmartDialog.showToast('${msg}aaa');
        break;
      default:
    }
  }

  @override
  MaCheckBox checkbox({bool? value, required Function(bool?) onChanged}) =>
      RoundMaCheckBox(onChanged: onChanged, value: value);

  @override
  showBottomModalSheet(context,
          {required String title,
          required Widget widget,
          Widget? action,
          double? sizeHeight}) =>
      MaBottomModalSheet.showMeModalBottomSheet(context,
          title: title, widget: widget, action: action);

  @override
  MaButton outlineButton(
      {required Function() onClick,
      required String title,
      Color? foregoundColor,
      Color? backgroundColor,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return OutlineMaButton(
        onClick: onClick,
        title: title,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        backgroundColor: backgroundColor,
        foregoundColor: foregoundColor);
  }
}

abstract class MatShow {
  showBottomModalSheet(context,
      {required String title,
      required Widget widget,
      double? sizeHeight,
      Widget? action});
  showMaDialog(
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
  showToast(String msg, {MaToastType type = MaToastType.information});
}

abstract class MatWidgets {
  MaButton button(
      {required Function() onClick, required String title, Widget? suffixIcon});
  MaButton outlineButton(
      {required Function() onClick,
      required String title,
      Color? foregoundColor,
      Color? backgroundColor,
      Widget? suffixIcon,
      Widget? prefixIcon});
  MaTextField textField(
      {required Function(String) onChanged,
      String? hintText,
      required TextEditingController controller,
      bool? isObscureText});
  MaCheckBox checkbox({bool? value, required Function(bool?) onChanged});
}

abstract class MatApp implements MatShow, MatWidgets {}
