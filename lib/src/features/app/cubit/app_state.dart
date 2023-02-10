// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({required this.isLightMode});
  final bool isLightMode;
  @override
  List<Object> get props => [isLightMode];

  AppState copyWith({
    bool? isLightMode,
  }) {
    return AppState(
      isLightMode: isLightMode ?? this.isLightMode,
    );
  }
}

class AppInitial extends AppState {
  const AppInitial({
    required super.isLightMode,
  });
}
