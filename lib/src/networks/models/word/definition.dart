import 'package:json_annotation/json_annotation.dart';

part 'definition.g.dart';

@JsonSerializable()
class Definition {
  @JsonKey(name: 'definition')
  String? definition;
  @JsonKey(name: 'example')
  String? example;

  Definition({
    this.definition,
    this.example,
  });

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);
}
