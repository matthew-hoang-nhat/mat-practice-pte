// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DoScore {
  final String? idCategory;
  final String idLesson;
  final List<String> answers;
  DoScore({
    this.idCategory,
    required this.idLesson,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCategory': idCategory,
      'idLesson': idLesson,
      'answers': answers,
    };
  }

  factory DoScore.fromMap(Map<String, dynamic> map) {
    return DoScore(
        idCategory: map['idCategory'] as String,
        idLesson: map['idLesson'] as String,
        answers: List<String>.from(
          (map['answers'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory DoScore.fromJson(String source) =>
      DoScore.fromMap(json.decode(source) as Map<String, dynamic>);

  DoScore copyWith({
    String? idCategory,
    String? idLesson,
    List<String>? answers,
  }) {
    return DoScore(
      idCategory: idCategory ?? this.idCategory,
      idLesson: idLesson ?? this.idLesson,
      answers: answers ?? this.answers,
    );
  }
}
