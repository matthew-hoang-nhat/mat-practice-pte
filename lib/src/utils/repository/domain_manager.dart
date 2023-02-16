import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/services/definition_service.dart';
import 'package:mat_practice_pte/src/utils/repository/authenticate_repository_impl.dart';
import 'package:mat_practice_pte/src/utils/repository/category_repository.dart';
import 'package:mat_practice_pte/src/utils/repository/category_repository_impl.dart';
import 'package:mat_practice_pte/src/utils/repository/lesson_repository.dart';
import 'package:mat_practice_pte/src/utils/repository/lesson_repository_impl.dart';
import 'package:mat_practice_pte/src/utils/repository/user_repository.dart';
import 'package:mat_practice_pte/src/utils/repository/user_repository_impl.dart';
import 'package:mat_practice_pte/src/utils/repository/word_repository_impl.dart';

import 'authenticate_repository.dart';
import 'word_repository.dart';

class DomainManager {
  DomainManager._() {
    authenticateRepository = AuthenticateRepositoryImpl(database);
    categoryRepository = CategoryRepositoryImpl(database);
    userRepository = UserRepositoryImpl(database);
    lessonRepository = LessonRepositoryImpl(database);
    wordRepository =
        WordRepositoryImpl(GlobalVariables.getIt<DefinitionService>());
  }
  final database = FirebaseFirestore.instance;
  static DomainManager? _instance;
  static DomainManager get instance => _instance ?? DomainManager._();

  late final AuthenticateRepository authenticateRepository;
  late final CategoryRepository categoryRepository;
  late final UserRepository userRepository;
  late final LessonRepository lessonRepository;
  late final WordRepository wordRepository;
}
