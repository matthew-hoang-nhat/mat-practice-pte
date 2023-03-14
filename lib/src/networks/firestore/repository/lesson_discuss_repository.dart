import 'package:mat_practice_pte/src/networks/f_result.dart';

import '../../models/lesson_data/lesson_discuss.dart';

abstract class LessonDiscussRepository {
  Future<FResult<List<LessonDiscuss>>> getDiscusses(
      String idCategory, String idLesson,
      {String? idLastHistory});
  Future<FResult<String>> removeDiscuss(String id);

  Future<FResult<String>> addDiscuss(LessonDiscuss discuss);

  Future<FResult<String>> replyDiscuss(String idParent, LessonDiscuss discuss);

  Future<FResult<String>> reactDiscuss(String id, String reaction);
  Future<FResult<String>> removeReactDiscuss(String id);
}
