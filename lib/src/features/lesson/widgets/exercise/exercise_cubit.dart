import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';

abstract class ExerciseCubit {
  void setDoScore(context);
  void setDetailLesson(DetailLesson lesson);
  void setDone();
  void setRedo();
}
