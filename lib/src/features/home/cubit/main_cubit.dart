import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainInitial(currentIndexTab: 0));

  void changeTab(int index) {
    emit(state.copyWith(currentIndexTab: index));
  }
}
