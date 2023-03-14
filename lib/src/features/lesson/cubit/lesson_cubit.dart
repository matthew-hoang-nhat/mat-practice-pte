import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_state.dart';
import 'package:mat_practice_pte/src/features/server/widgets/score_bottom_navigation_widget.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/lesson_repository.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/utils/wrapper.dart';
part 'lesson_action.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit(
      {FilterMarkEnum? filterMark,
      bool? isQNumDescending,
      required String idCategory,
      required int initIndex,
      required String initIdLesson,
      FilterPracticedEnum? filterPracticed})
      : super(LessonState.init(
            filterMark: filterMark,
            idCategory: idCategory,
            initIdLesson: initIdLesson,
            currentIndex: initIndex,
            isQNumDescending: isQNumDescending,
            filterPracticed: filterPracticed));

  final lessonRepo = DomainManager.instance.lessonRepository;
  final scrollController = ScrollController();

  final markRepo = DomainManager.instance.markRepository;
  Future<void> markOnClick(String? value) async {
    final newCurrentLesson =
        state.currentLesson?.copyWith(mark: Wrapper(value));
    var lessons = List<DetailLesson>.from(state.lessons);
    lessons[_indexLesson(newCurrentLesson!.id)] = newCurrentLesson;

    emit(state.copyWith(
      lessons: lessons,
      currentLesson: newCurrentLesson,
    ));

    final isDoMark = value != null;
    if (isDoMark) {
      markRepo.doMark(
          idCategory: state.idCategory,
          idLesson: state.currentLesson!.id,
          mark: value);
    } else {
      markRepo.unMark(
        idCategory: state.idCategory,
        idLesson: state.currentLesson!.id,
      );
    }
  }

  void initCubit() async {
    setIsLoading(true);

    final lessonResult = await lessonRepo.getDetailLesson(
      idCategory: state.idCategory,
      idLesson: state.initIdLesson,
    );

    fetchResource(lessonResult, onSuccess: () {
      emit(state.copyWith(
        currentLesson: lessonResult.data,
        lessons: [lessonResult.data!],
      ));
    });

    final countLessonResult = await lessonRepo.getCountFoundLesson(
        idCategory: state.idCategory,
        filterMark: state.filterMark,
        filterPracticed: state.filterPracticed);

    fetchResource(countLessonResult, onSuccess: () {
      emit(state.copyWith(maxIndex: countLessonResult.data));
    });

    setIsLoading(false);
  }

  void doneOnCLick() async {
    emit(state.copyWith(isDone: true));
    setIsShowAnswer(true);

    if (state.isDone && state.doScore != null) {
      await _doScore();
      clearDoScore();
    }
  }

  void redoOnClick() async {
    emit(state.copyWith(isDone: false));
    setIsShowAnswer(false);

    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  final serverRepo = DomainManager.instance.server;
  Future<void> _doScore() async {
    if (state.doScore != null) {
      final scoreResult = await serverRepo.doScore(state.doScore!);
      fetchResource(scoreResult, onSuccess: () {
        final score = scoreResult.data!['myScore']!;
        final totalScore = scoreResult.data!['totalScore']!;
        FCoordinator.showBottomModalSheet(
          title: Center(child: Text('Result', style: AppTextStyles.headline6)),
          widget: ScoreBottomNavigationWidget(
            myScore: score,
            total: totalScore,
            onCancel: FCoordinator.onBack,
            title: state.currentLesson!.title,
          ),
        );
      });
    }
  }

  Future<void> loadMoreLessons(
      {FetchArrowType type = FetchArrowType.next}) async {
    if (state.currentIndex + 1 >= state.lessons.length - 2 &&
        state.lessons.length < state.maxIndex!) {
      final newLessonsResult = await lessonRepo.getLessons(
          idCategory: state.idCategory,
          filterMark: state.filterMark,
          idLastLesson: state.lessons.last.id,
          fetchArrowType: type,
          isQNumDescending: state.isQNumDescending,
          filterPracticed: state.filterPracticed);

      fetchResource(newLessonsResult, onSuccess: () {
        switch (type) {
          case FetchArrowType.next:
            emit(state.copyWith(
                lessons: [...state.lessons, ...newLessonsResult.data!]));
            break;
          case FetchArrowType.previous:
            emit(state.copyWith(
                lessons: [...newLessonsResult.data!, ...state.lessons]));
            break;
          default:
        }
      });

      await Future.delayed(const Duration(microseconds: 500));
    }
  }

  int _indexLesson(String idLesson) {
    return state.lessons.indexWhere((element) => element.id == idLesson);
  }

  Future<void> nextOntap() async {
    if (state.isLoading) return;
    setIsLoading(true);

    final indexCurrentLesson = _indexLesson(state.currentLesson!.id);
    if (state.currentIndex < state.maxIndex! &&
        indexCurrentLesson >= state.lessons.length - 1) {
      await loadMoreLessons();
    }
    emit(state.copyWith(
      currentIndex: state.currentIndex + 1,
      currentLesson: state.lessons.elementAt(indexCurrentLesson + 1),
      isDone: false,
      isShowAnswer: false,
    ));

    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
    await Future.delayed(const Duration(seconds: 1));

    setIsLoading(false);
  }

  Future<void> previousOnTap() async {
    if (state.isLoading) return;
    setIsLoading(true);

    final indexCurrentLesson = _indexLesson(state.currentLesson!.id);
    if (state.currentIndex > 0 && indexCurrentLesson <= 0) {
      await loadMoreLessons(type: FetchArrowType.previous);
    }

    final newIndexCurrentLesson = _indexLesson(state.currentLesson!.id) - 1;

    emit(state.copyWith(
      currentIndex: state.currentIndex - 1,
      currentLesson: state.lessons.elementAt(newIndexCurrentLesson),
      isDone: false,
      isShowAnswer: false,
    ));

    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );

    await Future.delayed(const Duration(seconds: 1));

    setIsLoading(false);
  }

  @override
  void emit(LessonState state) {
    if (isClosed) return;
    super.emit(state);
  }

  void setIsLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  void setIsShowAnswer(bool value) {
    emit(state.copyWith(isShowAnswer: value));
  }

  void clearDoScore() {
    emit(state.copyWith(doScore: Wrapper(null)));
  }

  void setDoScore(DoScore doScore) {
    emit(state.copyWith(
        doScore: Wrapper(doScore.copyWith(
      idCategory: state.idCategory,
    ))));
  }
}
