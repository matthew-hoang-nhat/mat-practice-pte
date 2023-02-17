// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:logger/logger.dart';

import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/raw_lesson_repository.dart';

import 'lesson_repository.dart';
import 'lesson_user_data_repository.dart';

class LessonRepositoryImpl extends LessonRepository {
  final RawLessonRepository rawLessonRepository;
  final LessonUserDataRepository lessonUserDataRepository;
  LessonRepositoryImpl(
      {required this.rawLessonRepository,
      required this.lessonUserDataRepository});
  String? get uid => GlobalVariables.getIt<FUser>().firebaseUser?.uid;

  Future<FResult<List<DetailLesson>>> _getDetailLessonsNoFilter({
    required String idCategory,
    String? lastIdLesson,
    required bool isQNumDescending,
  }) async {
    // try {
    final lessons = <DetailLesson>[];
    final result = await rawLessonRepository.getRawLessons(
        idCategory: idCategory,
        isQNumDescending: isQNumDescending,
        lastIdLesson: lastIdLesson);

    fetchResource(result, onSuccess: () {
      lessons.addAll(result.data!);
    });

    final List<Future<FResult<LessonUserData>>> awaitLessonUserDataArr = [];
    for (var item in lessons) {
      awaitLessonUserDataArr.add(lessonUserDataRepository.getLessonUserData(
          idLesson: item.id, idCategory: idCategory));
    }

    final resultLessonUserDataArr = await Future.wait(awaitLessonUserDataArr);
    for (int index = 0; index < lessons.length; index++) {
      final lessonUserData = resultLessonUserDataArr.elementAt(index).data;
      if (lessonUserData != null) {
        lessons[index] = lessons[index].copyWith(
          countPracticed: lessonUserData.practiced,
          mark: lessonUserData.mark,
        );
      }
    }

    return FResult.success(lessons);
    // } catch (ex) {
    //   return FResult.error(ex.toString());
    // }
  }

  @override
  Future<FResult<DetailLesson>> getDetailLesson(
          {required String idCategory, required String idLesson}) =>
      rawLessonRepository.getRawDetailLesson(
          idCategory: idCategory, idLesson: idLesson);

  Future<FResult<List<DetailLesson>>> _getLessonsWithFilter({
    required String idCategory,
    String? lastIdLesson,
    required FilterMarkEnum? filterMark,
    required bool isQNumDescending,
    required FilterPracticedEnum? filterPracticed,
  }) async {
    try {
      List<LessonUserData> lessonUserDatas = <LessonUserData>[];
      final lessonUserDatasResult =
          await lessonUserDataRepository.getUserLessons(
        idCategory: idCategory,
        filterMark: filterMark,
        filterPracticed: filterPracticed,
        isQNumDescending: isQNumDescending,
        lastIdLesson: lastIdLesson,
      );
      fetchResource(lessonUserDatasResult, onSuccess: () {
        lessonUserDatas = lessonUserDatasResult.data!;
      }, onError: () {
        Logger().e(lessonUserDatasResult.error);
      });

      final detailLessonsResult = await _getDetailLessonFromLessonUserDatas(
          lessonUserDatas, idCategory);
      return FResult.success(detailLessonsResult.data);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  Future<FResult<List<DetailLesson>>> _getDetailLessonFromLessonUserDatas(
      List<LessonUserData> lessonUserDatas, String idCategory) async {
    try {
      final lessons = <DetailLesson>[];

      final lessonUserDataAwaitArr = <Future<FResult<DetailLesson>>>[];
      for (var lessonUserData in lessonUserDatas) {
        lessonUserDataAwaitArr.add(getDetailLesson(
            idCategory: idCategory, idLesson: lessonUserData.id));
      }

      // get Lesson
      final lessonUserDataResults = await Future.wait(lessonUserDataAwaitArr);
      for (var lessonUserDataResult in lessonUserDataResults) {
        lessons.add(lessonUserDataResult.data!);
      }

      for (int index = 0; index < lessons.length; index++) {
        final countPracticed = lessonUserDatas.elementAt(index).practiced;
        lessons[index] =
            lessons[index].copyWith(countPracticed: countPracticed);
      }

      // get mark practiced a lesson
      for (int index = 0; index < lessons.length; index++) {
        final markCode = lessonUserDatas.elementAt(index).mark;
        lessons[index] = lessons[index].copyWith(mark: markCode);
      }

      return FResult.success(lessons);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<List<DetailLesson>>> getLessons(
      {required String idCategory,
      String? idLastLesson,
      FilterMarkEnum? filterMark,
      bool isQNumDescending = false,
      FilterPracticedEnum? filterPracticed}) {
    if (filterMark == null && filterPracticed == null) {
      return Future.value(_getDetailLessonsNoFilter(
          isQNumDescending: isQNumDescending,
          idCategory: idCategory,
          lastIdLesson: idLastLesson));
    }

    return Future.value(_getLessonsWithFilter(
        idCategory: idCategory,
        lastIdLesson: idLastLesson,
        filterMark: filterMark,
        isQNumDescending: isQNumDescending,
        filterPracticed: filterPracticed));
  }

  @override
  Future<FResult<int>> getCountFoundLesson(
      {required String idCategory,
      FilterMarkEnum? filterMark,
      FilterPracticedEnum? filterPracticed}) {
    if (filterMark != null || filterPracticed != null) {
      return Future.value(
          lessonUserDataRepository.getCountFoundLessonWithFilter(
              idCategory: idCategory,
              filterMark: filterMark,
              filterPracticed: filterPracticed));
    }
    return Future.value(
        rawLessonRepository.getRawCountFoundLesson(idCategory: idCategory));
  }
}
