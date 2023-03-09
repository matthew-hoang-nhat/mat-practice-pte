import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

part 'discuss_state.dart';

class DiscussCubit extends Cubit<DiscussState> {
  DiscussCubit() : super(DiscussState.init());

  // final heeh =
  String get uid => GlobalVariables.auth.currentUser!.uid;

  void tabOnClick(int index) {
    const tabs = DiscussTab.values;
    emit(state.copyWith(tab: tabs[index]));
  }
}
