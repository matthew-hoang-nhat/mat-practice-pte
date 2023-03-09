// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'history_cubit.dart';

class HistoryState extends Equatable {
  const HistoryState({
    required this.idLesson,
    required this.lessonHistories,
  });

  final String idLesson;
  final List<LessonHistory> lessonHistories;

  @override
  List<Object?> get props => [
        lessonHistories,
        idLesson,
      ];

  factory HistoryState.init() => const HistoryState(
        lessonHistories: [],
        idLesson: '',
      );

  HistoryState copyWith({
    String? idLesson,
    List<LessonHistory>? lessonHistories,
  }) {
    return HistoryState(
      idLesson: idLesson ?? this.idLesson,
      lessonHistories: lessonHistories ?? this.lessonHistories,
    );
  }
}
