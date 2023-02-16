import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/helpers/firebase_error.dart';
import 'package:mat_practice_pte/src/utils/helpers/validates.dart';
import 'package:mat_practice_pte/src/utils/remote/fetch_resource.dart';
import 'package:mat_practice_pte/src/utils/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit()
      : super(const ForgotPasswordInitial(
            isLoading: false, notificationEmail: ''));

  final authRepo = DomainManager.instance.authenticateRepository;
  final fShows = GlobalVariables.getIt<FApp>();
  final TextEditingController emailController = TextEditingController();
  final fLocate = GlobalVariables.getIt<FLocate>();
  emailPasswordOnChanged(String value) {}

  setIsLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  bool isFilledAllTextFields() {
    return emailController.text.isNotEmpty;
  }

  checkFilledAllTextFields() {
    if (emailController.text.isEmpty) {
      emit(state.copyWith(notificationEmail: fLocate.str(FLocalKey.require)));
    } else {
      emit(state.copyWith(notificationEmail: ''));
    }
  }

  bool isValidatedAllFields() {
    final email = emailController.text;
    if (Validates.invalidateEmail(email)) return false;

    return true;
  }

  checkValidatedAllTextFields() {
    final email = emailController.text;
    if (Validates.invalidateEmail(email)) {
      emit(state.copyWith(
          notificationEmail: fLocate.str(FLocalKey.invalidEmail)));
    } else {
      emit(state.copyWith(notificationEmail: ''));
    }
  }

  sendEmailOnClick() async {
    if (isFilledAllTextFields() == false) {
      checkFilledAllTextFields();
      return;
    }

    if (isValidatedAllFields() == false) {
      checkValidatedAllTextFields();
      return;
    }

    setIsLoading(true);
    final email = emailController.text;
    final result = await authRepo.sendPasswordResetEmail(email: email);
    fetchResource(
      result,
      onSuccess: () {
        fShows.showToast(fLocate.str(FLocalKey.successfullySendToEmail));
        FCoordinator.goNamed(AppPaths.login);
      },
      onError: () {
        final notificationEmail =
            FFirebaseError.errorToAnnounce(code: result.error!);
        emit(state.copyWith(notificationEmail: notificationEmail));
      },
    );
    setIsLoading(false);
  }
}
