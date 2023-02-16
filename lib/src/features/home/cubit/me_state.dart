// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'me_cubit.dart';

class MeState extends Equatable {
  const MeState({required this.nickname});
  factory MeState.init() => const MeState(nickname: '');
  final String nickname;
  @override
  List<Object> get props => [nickname];

  MeState copyWith({
    String? nickname,
  }) {
    return MeState(
      nickname: nickname ?? this.nickname,
    );
  }
}
