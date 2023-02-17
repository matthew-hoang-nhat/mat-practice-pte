import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../models/word/m_word.dart';
part 'definition_service.g.dart';

@RestApi()
abstract class DefinitionService {
  factory DefinitionService(Dio dio) => _DefinitionService(dio);

  @GET('/api/v2/entries/en/{word}')
  Future<List<MWord>> getWordDictionary(@Path('word') String word);
}
