import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/models/user/m_user.dart';

import 'package:mat_practice_pte/src/utils/global_variables.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial(user: null, currentIndexSplash: 0));

  final userRepo = DomainManager.instance.userRepository;
  final fUser = GlobalVariables.getIt<FUser>();
  late final pageViewController = PageController(initialPage: 0);
  Timer? _timer;

  pageViewOnChanged(int index) {
    emit(state.copyWith(currentIndexSplash: index));
  }

  addListenerPageView() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      final currentPage = state.currentIndexSplash;
      if (currentPage < 2) {
        emit(state.copyWith(currentIndexSplash: currentPage + 1));
      } else {
        emit(state.copyWith(currentIndexSplash: 0));
      }

      pageViewController.animateToPage(
        state.currentIndexSplash,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  initData() {
    emit(state.copyWith(user: fUser.user));
  }

  initCubit() {
    initData();
    fetchUserData();
    addListenerPageView();
  }

  readingOnClick() {
    FCoordinator.goNamed(AppPaths.parentCategory, extra: 'reading');
  }

  listeningOnCLick() {
    FCoordinator.goNamed(AppPaths.parentCategory, extra: 'listening');
  }

  Future<void> fetchUserData() async {
    final result =
        await userRepo.getInfoUser(uid: fUser.firebaseUser?.uid ?? '');
    fetchResource(
      result,
      onSuccess: () {
        emit(state.copyWith(user: result.data));
        fUser.user = result.data;
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    pageViewController.dispose();
    return super.close();
  }
}
