import 'package:mat_practice_pte/src/networks/f_result.dart';

abstract class MarkRepository {
  Future<FResult<String>> doMark(
      {required String idLesson,
      required String idCategory,
      required String mark});
  Future<FResult<String>> unMark({
    required String idLesson,
    required String idCategory,
  });
  Future<FResult<String>> refetchMark({
    required String idLesson,
    required String idCategory,
  });
}
