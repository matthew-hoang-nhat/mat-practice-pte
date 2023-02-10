import 'dart:convert';

class FCategory {
  final String id;
  final String name;
  final String codeName;
  final String hexCodeColor;
  final int foundLesson;

  FCategory({
    required this.id,
    required this.name,
    required this.codeName,
    required this.hexCodeColor,
    required this.foundLesson,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'codeName': codeName,
      'hexCodeColor': hexCodeColor,
      'foundLesson': foundLesson,
    };
  }

  factory FCategory.fromMap(Map<String, dynamic> map) {
    return FCategory(
      id: map['id'] as String,
      name: map['name'] as String,
      codeName: map['codeName'] as String,
      hexCodeColor: map['hexCodeColor'] as String,
      foundLesson: map['foundLesson'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FCategory.fromJson(String source) =>
      FCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}
