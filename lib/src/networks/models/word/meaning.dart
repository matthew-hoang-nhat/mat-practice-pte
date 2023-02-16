import 'package:json_annotation/json_annotation.dart';

import 'definition.dart';

part 'meaning.g.dart';

@JsonSerializable()
class Meaning {
  @JsonKey(name: 'definitions')
  List<Definition>? definitions;
  @JsonKey(name: 'partOfSpeech')
  String? partOfSpeech;
  Meaning({this.definitions});

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningToJson(this);
}
