import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/word/m_word.dart';
import 'package:mat_practice_pte/src/utils/remote/services/definition_service.dart';
import 'package:mat_practice_pte/src/utils/repository/word_repository.dart';

class WordRepositoryImpl extends WordRepository {
  final wordService = GlobalVariables.getIt<DefinitionService>();
  String? get uid => GlobalVariables.getIt<FUser>().firebaseUser?.uid;
  @override
  Future<FResult<MWord>> getDefinition(String text) async {
    try {
      final words = await wordService.getWordDictionary(text);
      final word = words.first;
      return FResult.success(word);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
