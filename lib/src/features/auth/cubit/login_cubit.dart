import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/locate/ma_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/ma_locate.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/fetch_resource.dart';
import 'package:mat_practice_pte/src/utils/repository/authenticate_repository_impl.dart';
import 'package:mat_practice_pte/src/widgets/mat.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(const LoginInitial(
          isLiked: false,
          isAccepted: false,
          isLoading: false,
          notificationEmail: '',
          notificationPassword: '',
        ));

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authenticateRepo = GlobalVariables.getIt<AuthenticateRepositoryImpl>();
  final mat = GlobalVariables.getIt<MatApp>();

  emailOnChanged(String value) {
    if (state.notificationEmail.isNotEmpty && value.isNotEmpty) {
      emit(state.copyWith(notificationEmail: ''));
    }
  }

  passwordOnChanged(String value) {
    if (state.notificationPassword.isNotEmpty && value.isNotEmpty) {
      emit(state.copyWith(notificationPassword: ''));
    }
  }

  bool isFilledAllTextFields() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  checkFilledAllTextFields() {
    if (emailController.text.isEmpty) {
      emit(state.copyWith(notificationEmail: maLocate.str(MaLocalKey.require)));
    } else {
      emit(state.copyWith(notificationEmail: ''));
    }
    if (passwordController.text.isEmpty) {
      emit(state.copyWith(
          notificationPassword: maLocate.str(MaLocalKey.require)));
    } else {
      emit(state.copyWith(notificationPassword: ''));
    }
  }

  loginWithEmailPasswordOnClick(context) async {
    if (isFilledAllTextFields() == false) {
      checkFilledAllTextFields();
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await authenticateRepo.loginWithEmailPassword(
        email: emailController.text, password: passwordController.text);

    emit(state.copyWith(isLoading: false));

    fetchResource(
      result,
      onSuccess: () {
        mat.showToast(maLocate.str(MaLocalKey.successfullyLogin));
        GoRouter.of(GlobalVariables.navigatorKey.currentContext!)
            .goNamed(AppPaths.home);
      },
      onError: () {
        notificationError(result.error ?? '');
      },
    );
  }

  final maLocate = GlobalVariables.getIt<MaLocate>();
  notificationError(String error) {
    switch (error) {
      case 'user-not-found':
        mat.showToast(maLocate.str(MaLocalKey.userNotFound));
        break;
      case 'wrong-password':
        mat.showToast(maLocate.str(MaLocalKey.wrongUsernameOrPassword));
        break;
      default:
        mat.showToast('Error something');
    }
  }

  loginWithGoogleOnClick() async {
    final result = await authenticateRepo.loginWithGoogle();

    fetchResource(
      result,
      onSuccess: () {
        GoRouter.of(GlobalVariables.navigatorKey.currentContext!)
            .goNamed(AppPaths.home);
      },
      onError: () {},
    );
  }

  setLike(bool value) {
    emit(state.copyWith(isLiked: value));
  }

  setAccepted(bool? value) {
    emit(state.copyWith(isAccepted: value));
  }
}
