import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/word/m_word.dart';

abstract class WordRepository {
  Future<FResult<MWord>> getDefinition(String text);
}
