// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import '../cubit/search_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, this.controller, this.isDisable})
      : super(key: key);
  final TextEditingController? controller;
  final bool? isDisable;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: AppColors.red,
          hintText: GlobalVariables.getIt<FLocate>().str(FLocalKey.hintSearch),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0))),
      onSubmitted: context.read<SearchCubit>().submitSearchOnClick,
      enabled: isDisable ?? true,
    );
  }
}
