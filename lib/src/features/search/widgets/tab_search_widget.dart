// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/search/cubit/search_cubit.dart';

import '../cubit/search_state.dart';

class TabSearchWidget extends StatelessWidget {
  const TabSearchWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) => previous.tab != current.tab,
      builder: (context, state) {
        return Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    controller: tabController,
                    labelColor: AppColors.black,
                    unselectedLabelColor: AppColors.grey,
                    indicatorColor: AppColors.black,
                    tabs: SearchTab.values
                        .map((e) => Tab(text: e.toString()))
                        .toList(),
                    onTap: (index) {
                      context.read<SearchCubit>().tabOnClick(index);
                    },
                    labelStyle: AppTextStyles.body1,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
