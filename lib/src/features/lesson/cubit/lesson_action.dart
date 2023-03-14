part of 'lesson_cubit.dart';

abstract class LessonAction {
  nextLesson();
  previousLesson();
  doneLesson();
  redoLesson();
  markLesson();
  unMarkLesson();
  showAnswer();
}
