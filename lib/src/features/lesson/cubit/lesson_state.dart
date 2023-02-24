// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/utils/wrapper.dart';

class LessonState extends Equatable {
  const LessonState({
    required this.isShowAnswer,
    required this.currentLesson,
    required this.idCategory,
    required this.currentIndex,
    required this.initIdLesson,
    required this.maxIndex,
    required this.isLoading,
    required this.isDone,
    required this.doScore,
    required this.lessons,
    this.filterMark,
    this.isQNumDescending,
    this.filterPracticed,
  });
  factory LessonState.init(
          {required FilterMarkEnum? filterMark,
          required bool? isQNumDescending,
          required String idCategory,
          required String initIdLesson,
          required int currentIndex,
          required FilterPracticedEnum? filterPracticed}) =>
      LessonState(
        currentLesson: null,
        isShowAnswer: false,
        currentIndex: currentIndex,
        maxIndex: null,
        initIdLesson: initIdLesson,
        isLoading: false,
        isDone: false,
        doScore: null,
        lessons: const [],
        idCategory: idCategory,
        filterMark: filterMark,
        isQNumDescending: isQNumDescending,
        filterPracticed: filterPracticed,
      );
  final bool isShowAnswer;
  final DetailLesson? currentLesson;
  final int currentIndex;
  final int? maxIndex;
  final String idCategory;
  final String initIdLesson;
  final bool isLoading;
  final bool isDone;
  final DoScore? doScore;
  final List<DetailLesson> lessons;
  final FilterMarkEnum? filterMark;
  final bool? isQNumDescending;
  final FilterPracticedEnum? filterPracticed;
  @override
  List<Object?> get props => [
        isShowAnswer,
        currentIndex,
        currentLesson,
        initIdLesson,
        maxIndex,
        isLoading,
        isDone,
        doScore,
        lessons,
        filterMark,
        filterPracticed,
        isQNumDescending,
        idCategory,
      ];

  LessonState copyWith({
    bool? isShowAnswer,
    DetailLesson? currentLesson,
    int? currentIndex,
    int? maxIndex,
    String? idCategory,
    String? initIdLesson,
    bool? isLoading,
    bool? isDone,
    Wrapper<DoScore>? doScore,
    List<DetailLesson>? lessons,
    FilterMarkEnum? filterMark,
    bool? isQNumDescending,
    FilterPracticedEnum? filterPracticed,
  }) {
    return LessonState(
      isShowAnswer: isShowAnswer ?? this.isShowAnswer,
      currentLesson: currentLesson ?? this.currentLesson,
      currentIndex: currentIndex ?? this.currentIndex,
      maxIndex: maxIndex ?? this.maxIndex,
      idCategory: idCategory ?? this.idCategory,
      initIdLesson: initIdLesson ?? this.initIdLesson,
      isLoading: isLoading ?? this.isLoading,
      isDone: isDone ?? this.isDone,
      doScore: doScore == null ? this.doScore : doScore.value,
      lessons: lessons ?? this.lessons,
      filterMark: filterMark ?? this.filterMark,
      isQNumDescending: isQNumDescending ?? this.isQNumDescending,
      filterPracticed: filterPracticed ?? this.filterPracticed,
    );
  }
}
