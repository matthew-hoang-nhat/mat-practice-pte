import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

import '../cubit/discuss_cubit.dart';

class TabBarDiscuss extends StatelessWidget {
  const TabBarDiscuss({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscussCubit, DiscussState>(
      builder: (context, state) {
        return Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.black,
                    unselectedLabelColor: AppColors.grey,
                    indicatorColor: AppColors.black,
                    tabs: const [
                      Tab(text: 'Me'),
                      Tab(text: 'Discuss'),
                    ],
                    onTap: context.read<DiscussCubit>().tabOnClick,
                    labelStyle: AppTextStyles.body1,
                    indicatorSize: TabBarIndicatorSize.label,
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
