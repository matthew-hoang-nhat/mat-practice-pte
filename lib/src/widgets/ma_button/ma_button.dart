// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class RectangleButton extends MaButton {
  const RectangleButton(
      {super.key,
      required super.onClick,
      required super.title,
      super.isEnabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.colorPrimary)),
      child: Text(title),
    );
  }
}

abstract class MaButton extends StatelessWidget {
  const MaButton(
      {super.key, required this.onClick, required this.title, this.isEnabled});
  final Function() onClick;
  final String title;
  final bool? isEnabled;
}
