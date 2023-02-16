import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/home/cubit/main_cubit.dart';
import 'package:mat_practice_pte/src/features/home/ui/home_screen.dart';

import 'package:mat_practice_pte/src/widgets/bottom_app_bar/f_home_bottom_app_bar.dart';

import 'me_screen.dart';
import 'saved_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => MainCubit(),
      child: Scaffold(
        body: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            switch (state.currentIndexTab) {
              case 0:
                return const HomeScreen();
              case 1:
                return const SavedScreen();
              case 2:
              default:
                return const MeScreen();
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return FHomeBottomAppBar(
                onTap: context.read<MainCubit>().changeTab);
          },
        ),
      ),
    );
  }
}
