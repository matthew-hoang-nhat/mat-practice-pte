// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

import 'package:mat_practice_pte/src/networks/models/category/f_category.dart';
import 'package:mat_practice_pte/src/utils/helpers/helpers.dart';

import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    Key? key,
    required this.category,
  }) : super(key: key);
  final FCategory category;
  @override
  Widget build(BuildContext context) {
    Color itemColor = AppColors.colorPrimary;
    if (category.hexCodeColor.isNotEmpty) {
      itemColor = Helpers.fromStrHex(category.hexCodeColor);
    }
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          previous.selectedCategory != current.selectedCategory,
      builder: (context, state) {
        bool isSelected = (state.selectedCategory?.id == category.id);
        return InkWell(
          onTap: () => context.read<SearchCubit>().categoryOnClick(category),
          child: Container(
            height: 30,
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isSelected ? itemColor : itemColor.withOpacity(0.5)),
            alignment: Alignment.center,
            child: Text(
              category.codeName,
              textAlign: TextAlign.center,
              style: AppTextStyles.body2
                  .copyWith(color: AppColors.white, fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
