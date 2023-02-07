import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/locate/ma_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/ma_locate.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/fetch_resource.dart';
import 'package:mat_practice_pte/src/utils/repository/authenticate_repository_impl.dart';
import 'package:mat_practice_pte/src/widgets/mat.dart';

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

  final mat = GlobalVariables.getIt<MatApp>();
  final maLocate = GlobalVariables.getIt<MaLocate>();
  final authenticateRepo = GlobalVariables.getIt<AuthenticateRepositoryImpl>();

  notificationError(String error) {
    emit(state.copyWith(
        notificationEmail: '',
        notificationNickname: '',
        notificationPassword: ''));

    switch (error) {
      case 'weak-password':
        emit(state.copyWith(
            notificationPassword: maLocate.str(MaLocalKey.weakPassword)));
        break;
      case 'email-already-in-use':
        emit(state.copyWith(
            notificationEmail: maLocate.str(MaLocalKey.emailAlreadyInUse)));
        break;
      case 'invalid-email':
        emit(state.copyWith(
            notificationEmail: maLocate.str(MaLocalKey.invalidEmail)));
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
          notificationNickname: maLocate.str(MaLocalKey.require)));
    } else {
      emit(state.copyWith(notificationNickname: ''));
    }
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

  registerButtonOnClick(context) {
    if (isFilledAllTextFields() == false) {
      checkFilledAllTextFields();
      return;
    }

    mat.showAlertDialog(context,
        title: maLocate.str(MaLocalKey.titleNotiRegister),
        body: maLocate.str(MaLocalKey.bodyNotiRegister),
        actions: [
          {
            maLocate.str(MaLocalKey.agree): () async {
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
          maLocate.str(MaLocalKey.disagree): () {}
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
