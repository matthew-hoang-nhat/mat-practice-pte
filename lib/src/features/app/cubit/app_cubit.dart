import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/models/category/f_category.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'f_user.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial(isLightMode: true, categories: []));

  final _fuser = GlobalVariables.getIt<FUser>();

  initCubit() async {
    // await Future.delayed(const Duration(milliseconds: 500));
    // if (_fuser.isLogged) {
    //   GoRouter.of(GlobalVariables.navigatorKey.currentContext!)
    //       .goNamed(AppPaths.home);
    // }
    fetchCategories();
  }

  final categoryRepo = DomainManager.instance.categoryRepository;

  Future<void> fetchCategories() async {
    final result = await categoryRepo.getCategories();
    emit(state.copyWith(categories: result.data));
  }

  Future<void> signOut() async {
    await _fuser.signOut();
    FCoordinator.goNamed(AppPaths.login);
  }

  changeMode() {
    emit(state.copyWith(isLightMode: !state.isLightMode));
  }
}
