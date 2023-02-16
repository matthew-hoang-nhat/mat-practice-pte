import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mat_practice_pte/src/configs/constants/app_assets.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/widgets/bottom_modal_sheet/f_bottom_modal_sheet.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';

import 'package:mat_practice_pte/src/widgets/f_button/f_button.dart';
import 'package:mat_practice_pte/src/widgets/f_checkbox/f_checkbox.dart';
import 'package:mat_practice_pte/src/widgets/f_textfield/f_textfield.dart';

enum FShowType {
  warning,
  error,
  information;

  @override
  String toString() {
    switch (this) {
      case FShowType.information:
        return 'Information';

      case FShowType.error:
        return 'Error';

      case FShowType.warning:
        return 'Warning';
    }
  }
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
      double? borderRadius,
      bool? isObscureText}) {
    return RoundFTextField(
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      borderRadius: borderRadius ?? 4,
      isObscureText: isObscureText ?? false,
    );
  }

  @override
  showAlertDialog(
    context, {
    required String body,
    String? title,
    FShowType type = FShowType.information,
    required List<Map<String, Function()>> actions,
    required Map<String, Function()> redAction,
  }) {
    Color titleColor = AppColors.colorPrimary;
    switch (type) {
      case FShowType.information:
        titleColor = AppColors.colorPrimary;
        break;
      case FShowType.warning:
      case FShowType.error:
        titleColor = AppColors.red;
        break;
    }

    final titleAlert = title ?? type.toString();

    showDialog(
        context: context,
        builder: (dialogContext) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: FPaddingSizes.s30),
                    child: AlertDialog(
                        alignment: Alignment.center,
                        actionsAlignment: MainAxisAlignment.center,
                        title: Center(
                            child: Text(
                          titleAlert,
                          style: AppTextStyles.headline6
                              .copyWith(color: titleColor),
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
                                  Navigator.of(dialogContext).pop();
                                  redAction.values.first();
                                },
                                child: Text(
                                  redAction.keys.first,
                                  style: AppTextStyles.body2.copyWith(
                                      color: AppColors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                          ...actions
                              .map((e) => TextButton(
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop();
                                      e.values.first();
                                    },
                                    child: Text(e.keys.first),
                                  ))
                              .toList(),
                        ]),
                  ),
                  Image.asset(AppAssets.iconLogo, width: 70),
                ],
              )
            ],
          );
        });
  }

  @override
  showFDialog(
    context, {
    FShowType title = FShowType.information,
    required String body,
  }) {
    showDialog(
        context: context,
        builder: (dialogContext) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipRRect(
                    child: Padding(
                        padding: const EdgeInsets.only(top: FPaddingSizes.s30),
                        child: AlertDialog(
                          alignment: Alignment.center,
                          actionsAlignment: MainAxisAlignment.center,
                          title: Center(
                              child: Text(
                            title.toString(),
                            style: AppTextStyles.headline6
                                .copyWith(color: AppColors.colorPrimary),
                          )),
                          content: Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [Text(body)],
                          ),
                        )),
                  ),
                  Image.asset(AppAssets.iconLogo, width: 70),
                ],
              )
            ],
          );
        });
  }

  @override
  showToast(String msg, {FShowType type = FShowType.information}) {
    switch (type) {
      case FShowType.information:
        SmartDialog.showToast(msg);
        break;
      case FShowType.error:
      case FShowType.warning:
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
          {required Widget title,
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
      {required Widget title,
      required Widget widget,
      double? sizeHeight,
      Widget? action});

  showFDialog(
    context, {
    FShowType title,
    required String body,
  });
  showAlertDialog(
    context, {
    String? title,
    required String body,
    FShowType type,
    required List<Map<String, Function()>> actions,
    required Map<String, Function()> redAction,
  });
  showToast(String msg, {FShowType type = FShowType.information});
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
      double? borderRadius,
      required TextEditingController controller,
      bool? isObscureText});
  FCheckBox checkbox({bool? value, required Function(bool?) onChanged});
}

abstract class FApp implements FAppShows, FAppWidgets {}
