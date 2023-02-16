// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'question.dart';

class QuestionGroup {
  String? preQuestion;
  List<Question> questions;
  QuestionGroup({
    this.preQuestion,
    required this.questions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'preQuestion': preQuestion,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionGroup.fromMap(Map<String, dynamic> map) {
    return QuestionGroup(
      preQuestion:
          map['preQuestion'] != null ? map['preQuestion'] as String : null,
      questions: List<Question>.from(
        (map['questions'] as List).map<Question>(
          (x) => Question.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionGroup.fromJson(String source) =>
      QuestionGroup.fromMap(json.decode(source) as Map<String, dynamic>);
}
