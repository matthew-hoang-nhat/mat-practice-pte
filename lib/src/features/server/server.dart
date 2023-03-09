import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';

abstract class FServer {
  Future<FResult<Map<String, int>>> doScore(DoScore doScore);
  // Future<FResult<String>> uploadNewResultDoScoreUser();
}
