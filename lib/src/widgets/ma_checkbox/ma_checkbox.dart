import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class RoundMaCheckBox extends MaCheckBox {
  const RoundMaCheckBox({super.key, required super.onChanged, super.value});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: super.onChanged,
      activeColor: AppColors.colorPrimary,
    );
  }
}

abstract class MaCheckBox extends StatelessWidget {
  const MaCheckBox({super.key, required this.onChanged, this.value});
  final Function(bool?) onChanged;
  final bool? value;
}
