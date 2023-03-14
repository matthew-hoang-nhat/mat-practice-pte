import 'package:freezed_annotation/freezed_annotation.dart';

part 'phonetic.freezed.dart';
part 'phonetic.g.dart';

@freezed
class Phonetic with _$Phonetic {
  factory Phonetic({
    String? text,
    String? audio,
  }) = _Phonetic;

  factory Phonetic.fromJson(Map<String, Object?> json) =>
      _$PhoneticFromJson(json);
}
