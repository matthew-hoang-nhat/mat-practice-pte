import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/lesson_repository.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/lesson_repository_impl.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/lesson_user_data_repository_impl.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/raw_lesson_repository_impl.dart';

import '../../http/repository/word_repository.dart';
import '../../http/repository/word_repository_impl.dart';
import 'authenticate_repository.dart';
import 'authenticate_repository_impl.dart';
import 'category_repository.dart';
import 'category_repository_impl.dart';

import 'user_repository.dart';
import 'user_repository_impl.dart';

class DomainManager {
  DomainManager._() {
    authenticateRepository = AuthenticateRepositoryImpl();
    categoryRepository = CategoryRepositoryImpl();
    userRepository = UserRepositoryImpl();
    lessonRepository = LessonRepositoryImpl(
        lessonUserDataRepository: LessonUserDataRepositoryImpl(),
        rawLessonRepository: RawLessonRepositoryImpl());
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
