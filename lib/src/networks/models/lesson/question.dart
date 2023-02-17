import 'dart:convert';

class Question {
  String content;
  String answer;
  List<String> options;

  Question({
    required this.content,
    required this.answer,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'answer': answer,
      'options': options,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
        content: map['content'] as String,
        answer: map['answer'] as String,
        options: List<String>.from(
          (map['options'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
