import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/features/word_definition/cubit/show_bottom_definition_cubit.dart';

class WordInkwell extends StatelessWidget {
  const WordInkwell({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.colorPrimary,
      splashColor: AppColors.colorPrimary,
      focusColor: AppColors.colorPrimary,
      onTap: () => context
          .read<ShowBottomDefinitionCubit>()
          .showDefinition(context, text: text),
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Text(text),
      ),
    );
  }
}
