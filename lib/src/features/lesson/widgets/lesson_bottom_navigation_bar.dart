// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_state.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';

class LessonBottomNavigationBar extends StatelessWidget {
  const LessonBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<LessonCubit, LessonState>(
            buildWhen: (previous, current) =>
                previous.currentIndex != current.currentIndex ||
                previous.maxIndex != current.maxIndex,
            builder: (context, state) {
              final isFirstLoading = state.maxIndex == null;
              if (isFirstLoading) {
                return Container(width: 30);
              }
              if (state.currentIndex == 0) {
                return Container(width: 30);
              }
              return InkWell(
                  onTap: context.read<LessonCubit>().previousOnTap,
                  child: const SizedBox(
                      child: Icon(AppIcons.iconPrevious, size: 30)));
            },
          ),
          FSizeBoxs.w20,
          FSizeBoxs.w20,
          FSizeBoxs.w20,
          FSizeBoxs.w20,
          FSizeBoxs.w20,
          FSizeBoxs.w20,
          BlocBuilder<LessonCubit, LessonState>(
              buildWhen: (previous, current) =>
                  previous.currentIndex != current.currentIndex ||
                  previous.maxIndex != current.maxIndex,
              builder: (context, state) {
                final isFirstLoading = state.maxIndex == null;
                if (isFirstLoading) {
                  return Container(width: 30);
                }
                if (state.currentIndex >= state.maxIndex! - 1) {
                  return Container(width: 30);
                }
                return InkWell(
                    onTap: context.read<LessonCubit>().nextOntap,
                    child: const SizedBox(
                        child: Icon(AppIcons.iconNext, size: 30)));
              }),
        ],
      ),
    );
  }
}
