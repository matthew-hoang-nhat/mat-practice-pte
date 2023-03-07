import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';

class GlobalVariables {
  static final getIt = GetIt.instance;
  static final auth = FirebaseAuth.instance;
  static final nameRouteLessonType = {
    'L1': AppPaths.listeningMultipleChoiceAnswer,
    'L2': AppPaths.fillInBlanksTextFields,
    'L3': AppPaths.highlightSummary,
    'L4': AppPaths.listeningSingleChoiceAnswer,
    'L5': AppPaths.selectMissingWord,
    'L6': AppPaths.highlightIncorrectWord,
    'R1': AppPaths.fillInBlanks,
    'R2': AppPaths.mutipleChoiceAnswerScreen,
    'R3': AppPaths.reOrderParagraph,
    'R4': AppPaths.fillInBlanksDragAndDrog,
    'R5': AppPaths.singleChoiceAnswerScreen,
  };
}
