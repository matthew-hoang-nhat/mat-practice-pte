// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';

class OutlineFButton extends FButton {
  const OutlineFButton(
      {super.key,
      required super.onClick,
      required super.title,
      super.prefixIcon,
      super.suffixIcon,
      super.foregoundColor,
      super.backgroundColor,
      super.isEnabled});

  @override
  Widget build(BuildContext context) {
    final foregoundColor = super.foregoundColor ?? AppColors.colorPrimary;
    final backgroundColor = super.backgroundColor ?? AppColors.whiteGrey;
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              vertical: FPaddingSizes.s10, horizontal: FPaddingSizes.s20)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: foregoundColor)),
          ),
          textStyle: MaterialStateProperty.all(
              AppTextStyles.body1.copyWith(fontWeight: FontWeight.bold)),
          foregroundColor: MaterialStateProperty.all(foregoundColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor)),
      child: Wrap(
        children: [
          if (prefixIcon != null) prefixIcon!,
          Text(title),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}

class RectangleFButton extends FButton {
  const RectangleFButton(
      {super.key,
      required super.onClick,
      required super.title,
      super.suffixIcon,
      super.isEnabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          textStyle: MaterialStateProperty.all(
              AppTextStyles.body1.copyWith(fontWeight: FontWeight.bold)),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.colorPrimary)),
      child: Wrap(
        children: [
          if (prefixIcon != null) prefixIcon!,
          Text(title),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}

abstract class FButton extends StatelessWidget {
  const FButton(
      {super.key,
      required this.onClick,
      required this.title,
      this.isEnabled,
      this.foregoundColor,
      this.backgroundColor,
      this.prefixIcon,
      this.suffixIcon});
  final Function() onClick;
  final String title;
  final bool? isEnabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? foregoundColor;
  final Color? backgroundColor;
}
