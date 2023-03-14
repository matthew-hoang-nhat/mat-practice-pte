import 'package:freezed_annotation/freezed_annotation.dart';

import 'meaning.dart';
import 'phonetic.dart';
part 'm_word.g.dart';
part 'm_word.freezed.dart';

@freezed
class MWord with _$MWord {
  factory MWord({
    @JsonKey(name: 'word') required String word,
    @JsonKey(name: 'phonetics') required List<Phonetic> phonetics,
    @JsonKey(name: 'meanings') required List<Meaning>? meanings,
  }) = _MWord;

  factory MWord.fromJson(Map<String, Object?> json) => _$MWordFromJson(json);
}
