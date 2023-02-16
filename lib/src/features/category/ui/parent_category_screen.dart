import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/features/app/cubit/app_cubit.dart';
import 'package:mat_practice_pte/src/features/category/cubit/parent_category_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/helpers/helpers.dart';

import 'package:mat_practice_pte/src/utils/remote/models/f_category.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';

class ParentCategoryScreen extends StatelessWidget {
  const ParentCategoryScreen({Key? key, this.initIndexTab = 0})
      : super(key: key);
  final int initIndexTab;
  @override
  Widget build(BuildContext context) {
    final FLocate fLocate = GlobalVariables.getIt<FLocate>();
    return BlocProvider(
      create: (context) => ParentCategoryCubit()..initCubit(),
      child: DefaultTabController(
        length: 2,
        initialIndex: initIndexTab,
        child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              title: Text(fLocate.str(FLocalKey.practice)),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Text('Reading',
                      style: AppTextStyles.headline6
                          .copyWith(color: AppColors.white)),
                  Text('Listening',
                      style: AppTextStyles.headline6
                          .copyWith(color: AppColors.white)),
                ],
              ),
            ),
            body: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) =>
                  previous.categories != current.categories,
              builder: (context, state) {
                context
                    .read<ParentCategoryCubit>()
                    .separateCategories(state.categories);
                return TabBarView(
                  children: [
                    BlocBuilder<ParentCategoryCubit, ParentCategoryState>(
                      builder: (cubitContext, state) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: FPaddingSizes.s20),
                            child: Column(
                              children: state.readingCategories
                                  .map((e) => InkWell(
                                      onTap: () => context
                                          .read<ParentCategoryCubit>()
                                          .categoryOnClick(context, id: e.id),
                                      child: itemCategory(category: e)))
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<ParentCategoryCubit, ParentCategoryState>(
                      builder: (cubitContext, state) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: FPaddingSizes.s20),
                            child: Column(
                              children: state.listeningCategories
                                  .map((e) => InkWell(
                                      onTap: () => context
                                          .read<ParentCategoryCubit>()
                                          .categoryOnClick(context, id: e.id),
                                      child: itemCategory(category: e)))
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }

  Widget itemCategory({required FCategory category}) {
    Color itemColor = AppColors.colorPrimary;
    if (category.hexCodeColor.isNotEmpty) {
      itemColor = Helpers.fromStrHex(category.hexCodeColor);
    }
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: itemColor),
                alignment: Alignment.center,
                child: Text(
                  category.codeName,
                  style:
                      AppTextStyles.headline5.copyWith(color: AppColors.white),
                ),
              ),
              FSizeBoxs.w20,
              Flexible(
                child: Text(category.name,
                    style: AppTextStyles.body1.copyWith(fontSize: 18)),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
