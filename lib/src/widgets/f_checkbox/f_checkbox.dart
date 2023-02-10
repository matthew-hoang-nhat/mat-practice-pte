import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class RoundFCheckBox extends FCheckBox {
  const RoundFCheckBox({super.key, required super.onChanged, super.value});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: super.onChanged,
      activeColor: AppColors.colorPrimary,
    );
  }
}

abstract class FCheckBox extends StatelessWidget {
  const FCheckBox({super.key, required this.onChanged, this.value});
  final Function(bool?) onChanged;
  final bool? value;
}
