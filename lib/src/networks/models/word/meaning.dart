import 'package:freezed_annotation/freezed_annotation.dart';

import 'definition.dart';

part 'meaning.g.dart';
part 'meaning.freezed.dart';

@freezed
class Meaning with _$Meaning {
  factory Meaning({
    List<Definition>? definitions,
    String? partOfSpeech,
  }) = _Meaning;

  factory Meaning.fromJson(Map<String, Object?> json) =>
      _$MeaningFromJson(json);
}
