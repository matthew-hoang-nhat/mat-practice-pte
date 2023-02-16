import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class RoundFTextField extends FTextField {
  const RoundFTextField(
      {super.key,
      required super.onChanged,
      required super.controller,
      super.hintText,
      super.borderRadius = 4,
      super.isObscureText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: super.onChanged,
      obscureText: super.isObscureText,
      controller: super.controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppColors.colorBorder)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppColors.colorBorder))),
    );
  }
}

abstract class FTextField extends StatelessWidget {
  const FTextField(
      {super.key,
      required this.onChanged,
      this.hintText,
      required this.controller,
      this.borderRadius = 4,
      this.isObscureText = false});

  final TextEditingController controller;
  final Function(String) onChanged;
  final String? hintText;
  final double borderRadius;
  final bool isObscureText;
}
