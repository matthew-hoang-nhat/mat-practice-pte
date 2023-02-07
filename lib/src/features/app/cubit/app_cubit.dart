import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'f_user.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial(isLightMode: true));
  final fuser = GlobalVariables.getIt<FUser>();

  initCubit() async {
    await Future.delayed(const Duration(seconds: 1));
    if (fuser.isLogged) {
      GoRouter.of(GlobalVariables.navigatorKey.currentContext!)
          .goNamed(AppPaths.home);
    }
  }

  signOut() async {
    await fuser.signOut();
    GoRouter.of(GlobalVariables.navigatorKey.currentContext!)
        .goNamed(AppPaths.login);
  }

  changeMode() {
    emit(state.copyWith(isLightMode: !state.isLightMode));
  }
}
