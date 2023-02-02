import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class RoundMaTextField extends MaTextField {
  const RoundMaTextField(
      {super.key,
      required super.onChanged,
      required super.controller,
      super.hintText,
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
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorBorder)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorBorder))),
    );
  }
}

abstract class MaTextField extends StatelessWidget {
  const MaTextField(
      {super.key,
      required this.onChanged,
      this.hintText,
      required this.controller,
      this.isObscureText = false});
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? hintText;
  final bool isObscureText;
}
