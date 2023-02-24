import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';

import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

part 'me_state.dart';

class MeCubit extends Cubit<MeState> {
  MeCubit() : super(const MeInitial(nickname: ''));

  final fAppShows = GlobalVariables.getIt<FApp>();
  final fUser = GlobalVariables.getIt<FUser>();

  initCubit() {
    final nickname = fUser.user?.nickname ?? '';
    emit(state.copyWith(nickname: nickname));
  }

  signOutOnClick(context) {
    fAppShows.showAlertDialog(context,
        type: FShowType.warning,
        body: 'Do you want to logout? ',
        actions: [
          {'Cancel': () {}},
        ],
        redAction: {
          'Yes': () {
            GlobalVariables.auth.signOut();
            FCoordinator.showLoginScreen();
          }
        });
  }
}
