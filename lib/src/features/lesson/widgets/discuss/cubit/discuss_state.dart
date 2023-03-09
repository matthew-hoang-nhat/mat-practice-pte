part of 'discuss_cubit.dart';

enum DiscussTab {
  history,
  discuss,
}

class DiscussState extends Equatable {
  const DiscussState({
    required this.tab,
  });

  final DiscussTab tab;
  @override
  List<Object?> get props => [
        tab,
      ];

  factory DiscussState.init() => const DiscussState(
        tab: DiscussTab.history,
      );

  DiscussState copyWith({
    DiscussTab? tab,
  }) {
    return DiscussState(
      tab: tab ?? this.tab,
    );
  }
}
