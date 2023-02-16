// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({
    required this.currentIndexTab,
  });
  final int currentIndexTab;
  @override
  List<Object> get props => [currentIndexTab];

  MainState copyWith({
    int? currentIndexTab,
  }) {
    return MainState(
      currentIndexTab: currentIndexTab ?? this.currentIndexTab,
    );
  }
}

class MainInitial extends MainState {
  const MainInitial({required super.currentIndexTab});
}
