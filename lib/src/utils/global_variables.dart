import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';

class GlobalVariables {
  static final getIt = GetIt.instance;
  static final auth = FirebaseAuth.instance;
  static final nameRouteLessonType = {
    'R5': AppPaths.singleChoiceAnswerScreen,
    'R2': AppPaths.mutipleChoiceAnswerScreen,
    'R3': AppPaths.reOrderParagraph,
    'L3': AppPaths.highlightSummary,
  };
}
