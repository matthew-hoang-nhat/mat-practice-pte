import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import '../../f_result.dart';
import '../../models/word/m_word.dart';
import '../services/definition_service.dart';
import 'word_repository.dart';

class WordRepositoryImpl extends WordRepository {
  final ref = GlobalVariables.getIt<DefinitionService>();

  String? get uid => GlobalVariables.getIt<FUser>().firebaseUser?.uid;
  @override
  Future<FResult<MWord>> getDefinition(String text) async {
    try {
      final words = await ref.getWordDictionary(text);
      final word = words.first;
      return FResult.success(word);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
