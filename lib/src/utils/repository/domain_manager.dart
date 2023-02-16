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
    authenticateRepository = AuthenticateRepositoryImpl();
    categoryRepository = CategoryRepositoryImpl();
    userRepository = UserRepositoryImpl();
    lessonRepository = LessonRepositoryImpl();
    wordRepository = WordRepositoryImpl();
  }
  static DomainManager? _instance;
  static DomainManager get instance => _instance ?? DomainManager._();

  late final AuthenticateRepository authenticateRepository;
  late final CategoryRepository categoryRepository;
  late final UserRepository userRepository;
  late final LessonRepository lessonRepository;
  late final WordRepository wordRepository;
}
