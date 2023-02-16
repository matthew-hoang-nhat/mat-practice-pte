import 'package:dio/dio.dart';
import 'package:mat_practice_pte/src/utils/remote/models/word/m_word.dart';
import 'package:retrofit/http.dart';

part 'definition_service.g.dart';

@RestApi()
abstract class DefinitionService {
  factory DefinitionService(Dio dio) => _DefinitionService(dio);

  @GET('/api/v2/entries/en/{word}')
  Future<List<MWord>> getWordDictionary(@Path('word') String word);
}
