import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';

import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/fetch_resource.dart';
import 'package:mat_practice_pte/src/utils/repository/authenticate_repository_impl.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(const RegisterInitial(
          password: '',
          notificationEmail: '',
          notificationPassword: '',
          notificationNickname: '',
          email: '',
          username: '',
          isLiked: false,
          isAccepted: false,
          isLoading: false,
        ));

  TextEditingController passwordController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  paswordOnChanged(String value) {
    if (state.notificationPassword.isNotEmpty && value.isNotEmpty) {
      emit(state.copyWith(notificationPassword: ''));
    }
  }

  nicknameOnChanged(value) {
    if (state.notificationNickname.isNotEmpty && value.isNotEmpty) {
      emit(state.copyWith(notificationNickname: ''));
    }
  }

  emailOnChanged(value) {
    if (state.notificationEmail.isNotEmpty && value.isNotEmpty) {
      emit(state.copyWith(notificationEmail: ''));
    }
  }

  acceptedOnChanged(value) => _setAccepted(value);

  final mat = GlobalVariables.getIt<FApp>();
  final maLocate = GlobalVariables.getIt<FLocate>();
  final authenticateRepo = GlobalVariables.getIt<AuthenticateRepositoryImpl>();

  notificationError(String error) {
    emit(state.copyWith(
        notificationEmail: '',
        notificationNickname: '',
        notificationPassword: ''));

    switch (error) {
      case 'weak-password':
        emit(state.copyWith(
            notificationPassword: maLocate.str(FLocalKey.weakPassword)));
        break;
      case 'email-already-in-use':
        emit(state.copyWith(
            notificationEmail: maLocate.str(FLocalKey.emailAlreadyInUse)));
        break;
      case 'invalid-email':
        emit(state.copyWith(
            notificationEmail: maLocate.str(FLocalKey.invalidEmail)));
        break;
      default:
    }
  }

  bool isFilledAllTextFields() {
    return nicknameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  checkFilledAllTextFields() {
    if (nicknameController.text.isEmpty) {
      emit(state.copyWith(
          notificationNickname: maLocate.str(FLocalKey.require)));
    } else {
      emit(state.copyWith(notificationNickname: ''));
    }
    if (emailController.text.isEmpty) {
      emit(state.copyWith(notificationEmail: maLocate.str(FLocalKey.require)));
    } else {
      emit(state.copyWith(notificationEmail: ''));
    }
    if (passwordController.text.isEmpty) {
      emit(state.copyWith(
          notificationPassword: maLocate.str(FLocalKey.require)));
    } else {
      emit(state.copyWith(notificationPassword: ''));
    }
  }

  registerButtonOnClick(context) {
    if (isFilledAllTextFields() == false) {
      checkFilledAllTextFields();
      return;
    }

    mat.showAlertDialog(context,
        title: maLocate.str(FLocalKey.titleNotiRegister),
        body: maLocate.str(FLocalKey.bodyNotiRegister),
        actions: [
          {
            maLocate.str(FLocalKey.agree): () async {
              emit(state.copyWith(isLoading: true));
              final result = await authenticateRepo.registerEmailPassword(
                  email: emailController.text,
                  password: passwordController.text,
                  nickname: nicknameController.text);
              emit(state.copyWith(isLoading: false));
              fetchResource(result,
                  onSuccess: () {
                    mat.showToast('Successfully Registered');
                    GoRouter.of(context).pop();
                  },
                  onError: () => notificationError(result.error ?? ''));
            }
          }
        ],
        redAction: {
          maLocate.str(FLocalKey.disagree): () {}
        });
  }

////////////////////////////////////////////
  _setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  _setNickname(String username) {
    emit(state.copyWith(username: username));
  }

  _setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  _setAccepted(bool? value) {
    emit(state.copyWith(isAccepted: value));
  }
}
