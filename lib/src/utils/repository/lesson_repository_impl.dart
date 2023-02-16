import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/fetch_resource.dart';
import 'package:mat_practice_pte/src/utils/remote/models/detail_lesson.dart';
import 'package:mat_practice_pte/src/utils/repository/lesson_repository.dart';

class LessonRepositoryImpl extends LessonRepository {
  LessonRepositoryImpl(this._ref);
  final FirebaseFirestore _ref;

  String? get uid => GlobalVariables.getIt<FUser>().firebaseUser?.uid;
  final List<String> markCodes = ['red', 'grey'];

  final rootUsersS0 = 'users';
  final markS1 = 'mark';

  Future<FResult<List<dynamic>>> _getUserLessons(
      {required String idCategory,
      required FilterMarkEnum? filterMark,
      required FilterPracticedEnum? filterPracticed,
      required bool isQNumDescending,
      String? lastIdLesson}) async {
    try {
      dynamic query = _ref
          .collection(rootUsersS0)
          .doc(uid)
          .collection(FirebaseCollectionNames.resultUserData)
          .where('id_category', isEqualTo: idCategory);
      final markStr = filterMark.toString();

      switch (filterMark) {
        case FilterMarkEnum.red:
        case FilterMarkEnum.grey:
          query = query.where('mark', isEqualTo: markStr);
          break;

        case FilterMarkEnum.allMark:
          query = query.where('mark', isNotEqualTo: null);
          break;

        default:
      }

      switch (filterPracticed) {
        case FilterPracticedEnum.practiced:
          query = query.where('practiced', isNotEqualTo: null);
          break;

        default:
      }

      final docs = <QueryDocumentSnapshot>[];
      if (lastIdLesson == null) {
        final result = await query
            .orderBy('id', descending: isQNumDescending)
            .limit(5)
            .get();
        docs.addAll(result.docs);
      } else {
        final lastDocs = await query.where('id', isEqualTo: lastIdLesson).get();
        final lastDoc = lastDocs.docs.first;
        final result = await query
            .startAfterDocument(lastDoc)
            .orderBy('id', descending: isQNumDescending)
            .limit(5)
            .get();
        docs.addAll(result.docs);
      }

      final List<dynamic> userLessons = [];
      for (var doc in docs) {
        userLessons.add(doc.data());
      }

      return FResult.success(userLessons);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  Future<FResult<Map<String, dynamic>>> _getUserLesson({
    required String idLesson,
    required String idCategory,
  }) async {
    try {
      final result = await _ref
          .collection(rootUsersS0)
          .doc(uid)
          .collection(FirebaseCollectionNames.resultUserData)
          .where('id_category', isEqualTo: idCategory)
          .where('id', isEqualTo: idLesson)
          .get();

      final userLessonDoc = result.docs.first;
      final userLesson = userLessonDoc.data();
      return FResult.success(userLesson);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  Future<FResult<List<DetailLesson>>> getLessonsNoFilter({
    required String idCategory,
    String? lastIdLesson,
    required bool isQNumDescending,
  }) async {
    try {
      final docs = [];
      if (lastIdLesson == null) {
        final result = await _ref
            .collection('categories')
            .doc(idCategory)
            .collection('lessons')
            .orderBy('id', descending: isQNumDescending)
            .limit(5)
            .get();
        docs.addAll(result.docs);
      } else {
        final lastDocs = await _ref
            .collection('categories')
            .doc(idCategory)
            .collection('lessons')
            .where('id', isEqualTo: lastIdLesson)
            .get();
        final lastDoc = lastDocs.docs.first;
        final result = await _ref
            .collection('categories')
            .doc(idCategory)
            .collection('lessons')
            .orderBy('id', descending: isQNumDescending)
            .startAfterDocument(lastDoc)
            .limit(5)
            .get();
        docs.addAll(result.docs);
      }

      final lessons = <DetailLesson>[];
      for (var item in docs) {
        lessons.add(DetailLesson.fromMap(item.data()));
      }

      final List<Future<FResult<Map<String, dynamic>>>> awaitUserLessonArr = [];

      for (var item in lessons) {
        awaitUserLessonArr
            .add(_getUserLesson(idLesson: item.id, idCategory: idCategory));
      }

      final resultArr = await Future.wait(awaitUserLessonArr);

      for (int index = 0; index < lessons.length; index++) {
        final mark = resultArr.elementAt(index).data?['mark'];
        final countPracticed = resultArr.elementAt(index).data?['practiced'];
        lessons[index] = lessons[index].copyWith(
          countPracticed: countPracticed,
          mark: mark,
        );
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
      final lessonSnapshot = await _ref
          .collection('categories')
          .doc(idCategory)
          .collection('lessons')
          .where('id', isEqualTo: idLesson)
          .get();
      final lessonDoc = lessonSnapshot.docs.first.data();
      final lesson = DetailLesson.fromMap(lessonDoc);
      return FResult.success(lesson);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  Future<FResult<List<DetailLesson>>> getLessonsWithFilter({
    required String idCategory,
    String? lastIdLesson,
    required FilterMarkEnum? filterMark,
    required bool isQNumDescending,
    required FilterPracticedEnum? filterPracticed,
  }) async {
    // try {
    final userLessons = <dynamic>[];

    final result = await _getUserLessons(
      idCategory: idCategory,
      filterMark: filterMark,
      filterPracticed: filterPracticed,
      isQNumDescending: isQNumDescending,
      lastIdLesson: lastIdLesson,
    );

    fetchResource(result, onSuccess: () {
      userLessons.addAll(result.data as List<dynamic>);
    }, onError: () {
      Logger().e(result.error);
    });

    final lessons = <DetailLesson>[];
    final lessonAwaitArr = <Future<FResult<DetailLesson>>>[];

    for (var item in userLessons) {
      final idLesson = item['id'];
      lessonAwaitArr
          .add(getDetailLesson(idCategory: idCategory, idLesson: idLesson));
    }

    // get Lesson
    final lessonsResult = await Future.wait(lessonAwaitArr);
    for (var item in lessonsResult) {
      lessons.add(item.data!);
    }

    // get count practiced a lesson
    for (int index = 0; index < lessons.length; index++) {
      final countPracticed = userLessons.elementAt(index)['practiced'];
      lessons[index] = lessons[index].copyWith(countPracticed: countPracticed);
    }

    // get mark practiced a lesson
    for (int index = 0; index < lessons.length; index++) {
      final markCode = userLessons.elementAt(index)['mark'];
      lessons[index] = lessons[index].copyWith(mark: markCode);
    }

    return FResult.success(lessons);
    // } catch (ex) {
    //   return FResult.error(ex.toString());
    // }
  }

  @override
  Future<FResult<List<DetailLesson>>> getLessons(
      {required String idCategory,
      String? idLastLesson,
      FilterMarkEnum? filterMark,
      bool isQNumDescending = false,
      FilterPracticedEnum? filterPracticed}) {
    if (filterMark == null && filterPracticed == null) {
      return Future.value(getLessonsNoFilter(
          isQNumDescending: isQNumDescending,
          idCategory: idCategory,
          lastIdLesson: idLastLesson));
    }

    return Future.value(getLessonsWithFilter(
        idCategory: idCategory,
        lastIdLesson: idLastLesson,
        filterMark: filterMark,
        isQNumDescending: isQNumDescending,
        filterPracticed: filterPracticed));
  }

  Future<FResult<int>> getCountFoundLessonNoFilter(
      {required String idCategory}) async {
    try {
      final result = await _ref
          .collection(FirebaseCollectionNames.categories)
          .doc(idCategory)
          .collection(FirebaseCollectionNames.lessons)
          .count()
          .get();
      final count = result.count;
      return FResult.success(count);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  Future<FResult<int>> getCountFoundLessonWithFilter(
      {required String idCategory,
      FilterMarkEnum? filterMark,
      FilterPracticedEnum? filterPracticed}) async {
    try {
      dynamic query = _ref
          .collection(rootUsersS0)
          .doc(uid)
          .collection(FirebaseCollectionNames.resultUserData)
          .where('id_category', isEqualTo: idCategory);
      final markStr = filterMark.toString();

      switch (filterMark) {
        case FilterMarkEnum.red:
        case FilterMarkEnum.grey:
          query = query.where('mark', isEqualTo: markStr);
          break;

        case FilterMarkEnum.allMark:
          query = query.where('mark', isNotEqualTo: null);
          break;

        default:
      }

      switch (filterPracticed) {
        case FilterPracticedEnum.practiced:
          query = query.where('practiced', isNotEqualTo: null);
          break;

        default:
      }

      final result = await query.count().get();
      final count = result.count;

      return FResult.success(count);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<int>> getCountFoundLesson(
      {required String idCategory,
      FilterMarkEnum? filterMark,
      FilterPracticedEnum? filterPracticed}) {
    if (filterMark != null || filterPracticed != null) {
      return Future.value(getCountFoundLessonWithFilter(
          idCategory: idCategory,
          filterMark: filterMark,
          filterPracticed: filterPracticed));
    }
    return Future.value(getCountFoundLessonNoFilter(idCategory: idCategory));
  }
}
