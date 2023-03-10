import 'package:logger/logger.dart';

import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/raw_lesson_repository.dart';
import 'package:mat_practice_pte/src/utils/wrapper.dart';

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
    required FetchArrowType fetchArrowType,
    required bool isQNumDescending,
  }) async {
    try {
      final lessons = <DetailLesson>[];
      final result = await rawLessonRepository.getRawLessons(
          idCategory: idCategory,
          isQNumDescending: isQNumDescending,
          fetchArrowType: fetchArrowType,
          lastIdLesson: lastIdLesson);

      fetchResource(result, onSuccess: () {
        lessons.addAll(result.data!);
      });

      final List<Future<FResult<LessonUserData>>> awaitLessonUserDataArr =
          lessons
              .map((e) => lessonUserDataRepository.getLessonUserData(
                  idLesson: e.id, idCategory: idCategory))
              .toList();

      final resultLessonUserDataArr = await Future.wait(awaitLessonUserDataArr);

      for (int index = 0; index < lessons.length; index++) {
        final lessonUserData = resultLessonUserDataArr.elementAt(index).data;
        if (lessonUserData != null) {
          lessons[index] = lessons[index].copyWith(
            countPracticed: lessonUserData.countPracticed,
            mark: Wrapper(lessonUserData.codeMark),
          );
        }
      }

      return FResult.success(lessons);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<DetailLesson>> getDetailLesson(
      {required String idCategory, required String idLesson}) async {
    try {
      final rawDetailLessonResult = await rawLessonRepository
          .getRawDetailLesson(idCategory: idCategory, idLesson: idLesson);
      var rawDetailLesson = rawDetailLessonResult.data;
      final lessonUserDataResult = await lessonUserDataRepository
          .getLessonUserData(idLesson: idLesson, idCategory: idCategory);
      final lessonUserData = lessonUserDataResult.data;

      rawDetailLesson = rawDetailLesson?.copyWith(
        mark: Wrapper(lessonUserData?.codeMark),
        countPracticed: lessonUserData?.countPracticed,
      );
      return FResult.success(rawDetailLesson);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  Future<FResult<List<DetailLesson>>> _getLessonsWithFilter({
    required String idCategory,
    String? lastIdLesson,
    required FilterMarkEnum? filterMark,
    required bool isQNumDescending,
    required FetchArrowType fetchArrowType,
    required FilterPracticedEnum? filterPracticed,
  }) async {
    try {
      List<LessonUserData> lessonUserDatas = <LessonUserData>[];
      Logger().i(fetchArrowType);
      final lessonUserDatasResult =
          await lessonUserDataRepository.getLessonUserDatas(
        idCategory: idCategory,
        filterMark: filterMark,
        filterPracticed: filterPracticed,
        isQNumDescending: isQNumDescending,
        fetchArrowType: fetchArrowType,
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
            idCategory: idCategory, idLesson: lessonUserData.idLesson));
      }

      // get Lesson
      final lessonUserDataResults = await Future.wait(lessonUserDataAwaitArr);
      for (var lessonUserDataResult in lessonUserDataResults) {
        lessons.add(lessonUserDataResult.data!);
      }

      for (int index = 0; index < lessons.length; index++) {
        final countPracticed = lessonUserDatas.elementAt(index).countPracticed;
        lessons[index] =
            lessons[index].copyWith(countPracticed: countPracticed);
      }

      // get mark practiced a lesson
      for (int index = 0; index < lessons.length; index++) {
        final markCode = lessonUserDatas.elementAt(index).codeMark;
        lessons[index] = lessons[index].copyWith(mark: Wrapper(markCode));
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
      FetchArrowType fetchArrowType = FetchArrowType.next,
      FilterMarkEnum? filterMark,
      bool? isQNumDescending,
      FilterPracticedEnum? filterPracticed}) {
    if (filterMark == null && filterPracticed == null) {
      return Future.value(_getDetailLessonsNoFilter(
          isQNumDescending: isQNumDescending ?? false,
          idCategory: idCategory,
          fetchArrowType: fetchArrowType,
          lastIdLesson: idLastLesson));
    }

    return Future.value(_getLessonsWithFilter(
        idCategory: idCategory,
        lastIdLesson: idLastLesson,
        filterMark: filterMark,
        isQNumDescending: isQNumDescending ?? false,
        filterPracticed: filterPracticed,
        fetchArrowType: fetchArrowType));
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

  // @override
  // Future<FResult<String>> addRawLessons() {
  //   return rawLessonRepository.addRawLessons();
  // }
}
