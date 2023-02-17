import '../../f_result.dart';
import '../../models/word/m_word.dart';

abstract class WordRepository {
  Future<FResult<MWord>> getDefinition(String text);
}
