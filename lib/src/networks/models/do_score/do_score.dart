import 'package:freezed_annotation/freezed_annotation.dart';
part 'do_score.freezed.dart';
part 'do_score.g.dart';

@freezed
class DoScore with _$DoScore {
  factory DoScore({
    String? idCategory,
    required String idLesson,
    required List<String> answers,
  }) = _DoScore;

  factory DoScore.fromJson(Map<String, Object?> json) =>
      _$DoScoreFromJson(json);
}
