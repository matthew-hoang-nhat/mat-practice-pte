import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import '../../http/repository/word_repository.dart';
import '../../http/repository/word_repository_impl.dart';
import '../../http/services/definition_service.dart';
import 'authenticate_repository.dart';
import 'authenticate_repository_impl.dart';
import 'category_repository.dart';
import 'category_repository_impl.dart';
import 'lesson_repository.dart';
import 'lesson_repository_impl.dart';
import 'user_repository.dart';
import 'user_repository_impl.dart';

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
