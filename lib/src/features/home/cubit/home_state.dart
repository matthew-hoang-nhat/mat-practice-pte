// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({required this.currentIndexSplash, required this.user});
  factory HomeState.init() => const HomeState(
        currentIndexSplash: 0,
        user: null,
      );
  final MUser? user;
  final int currentIndexSplash;
  @override
  List<Object?> get props => [user, currentIndexSplash];

  HomeState copyWith({
    MUser? user,
    int? currentIndexSplash,
  }) {
    return HomeState(
      user: user ?? this.user,
      currentIndexSplash: currentIndexSplash ?? this.currentIndexSplash,
    );
  }
}
