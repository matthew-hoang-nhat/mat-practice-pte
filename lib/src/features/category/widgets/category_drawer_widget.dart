import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/category/cubit/drawer_cubit.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson_repository.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

class CategoryDrawerWidget extends StatelessWidget {
  const CategoryDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fWidgets = GlobalVariables.getIt<FApp>();
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mark',
                  style: AppTextStyles.headline6
                      .copyWith(color: AppColors.colorTextColor)),
            ],
          ),
          FSizeBoxs.h10,
          BlocBuilder<DrawerCubit, DrawerState>(
            buildWhen: (previous, current) => previous.mark != current.mark,
            builder: (context, state) {
              return Wrap(
                runSpacing: 10,
                spacing: 10,
                children: List.generate(
                  FilterMarkEnum.values.length,
                  (index) {
                    final markCode = FilterMarkEnum.values[index].toString();
                    return itemMarkWidget(
                        text: FilterMarkEnum.values[index].toString(),
                        isSelected: (state.mark == markCode),
                        onTap: () => context
                            .read<DrawerCubit>()
                            .markOnClick(context, mark: markCode));
                  },
                ),
              );
            },
          ),
          FSizeBoxs.h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Prac Status',
                  style: AppTextStyles.headline6
                      .copyWith(color: AppColors.colorTextColor)),
            ],
          ),
          FSizeBoxs.h10,
          BlocBuilder<DrawerCubit, DrawerState>(
            buildWhen: (previous, current) =>
                previous.practiced != current.practiced,
            builder: (context, state) {
              return Wrap(
                runSpacing: 10,
                spacing: 10,
                children: List.generate(
                  FilterPracticedEnum.values.length,
                  (index) {
                    final practicedStr =
                        FilterPracticedEnum.values.elementAt(index).toString();
                    return itemMarkWidget(
                        text: practicedStr,
                        isSelected: (state.practiced == practicedStr),
                        onTap: () => context
                            .read<DrawerCubit>()
                            .pracStatusOnClick(practiced: practicedStr));
                  },
                ),
              );
            },
          ),
          const Spacer(),
          Row(
            children: [
              BlocBuilder<DrawerCubit, DrawerState>(
                builder: (context, state) {
                  return fWidgets.outlineButton(
                      onClick: context.read<DrawerCubit>().resetButtonOnClick,
                      title: 'Reset');
                },
              ),
              FSizeBoxs.w10,
              BlocBuilder<DrawerCubit, DrawerState>(
                builder: (context, state) {
                  return fWidgets.button(
                      onClick: context.read<DrawerCubit>().okButtonOnClick,
                      title: 'OK');
                },
              ),
            ],
          )
        ]),
      ),
    );
  }

  Widget itemMarkWidget(
      {required text, bool isSelected = false, required Function() onTap}) {
    final foregroundColor = (isSelected == true)
        ? AppColors.colorPrimary
        : AppColors.colorTextColor;
    final backgroundColor = (isSelected == true)
        ? AppColors.colorPrimary.withOpacity(0.1)
        : AppColors.grey.withOpacity(0.3);
    final borderColor =
        (isSelected == true) ? AppColors.colorPrimary : Colors.transparent;
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5),
            color: backgroundColor,
          ),
          child: Text(text,
              style: AppTextStyles.body2.copyWith(
                color: foregroundColor,
              ))),
    );
  }
}
