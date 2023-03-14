import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';

abstract class DoScoreRepository {
  Future<FResult<String>> doScore(DoScore doScore);
}
