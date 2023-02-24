// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:mat_practice_pte/src/utils/wrapper.dart';

import 'question_group.dart';

enum FilterMarkEnum {
  allMark,
  red,
  grey;

  static FilterMarkEnum? tryParse(String value) {
    switch (value) {
      case 'Red':
        return FilterMarkEnum.red;
      case 'Grey':
        return FilterMarkEnum.grey;
      case 'All mark':
        return FilterMarkEnum.allMark;

      default:
    }
    return null;
  }

  @override
  String toString() {
    switch (this) {
      case FilterMarkEnum.red:
        return 'Red';
      case FilterMarkEnum.grey:
        return 'Grey';
      case FilterMarkEnum.allMark:
        return 'All mark';
    }
  }
}

enum FilterPracticedEnum {
  practiced;

  static FilterPracticedEnum? tryParse(String value) {
    switch (value) {
      case 'Practiced':
        return FilterPracticedEnum.practiced;
      default:
    }
    return null;
  }

  @override
  String toString() {
    switch (this) {
      case FilterPracticedEnum.practiced:
        return 'Practiced';
    }
  }
}

class DetailLesson {
  final String id;
  final String codeLesson;
  final String title;
  final String content;
  final String idCategory;
  final String? audioUrl;
  final String? timeCreated;
  final String? mark;
  final int? countPracticed;
  final QuestionGroup questionGroup;
  DetailLesson({
    required this.id,
    required this.codeLesson,
    required this.title,
    required this.content,
    required this.idCategory,
    this.audioUrl,
    this.timeCreated,
    this.mark,
    this.countPracticed,
    required this.questionGroup,
  });

  DetailLesson copyWith({
    String? id,
    String? codeLesson,
    String? title,
    String? content,
    String? idCategory,
    String? audioUrl,
    String? timeCreated,
    Wrapper<String>? mark,
    int? countPracticed,
    QuestionGroup? questionGroup,
  }) {
    return DetailLesson(
      id: id ?? this.id,
      codeLesson: codeLesson ?? this.codeLesson,
      title: title ?? this.title,
      content: content ?? this.content,
      idCategory: idCategory ?? this.idCategory,
      audioUrl: audioUrl ?? this.audioUrl,
      timeCreated: timeCreated ?? this.timeCreated,
      mark: mark == null ? this.mark : mark.value,
      countPracticed: countPracticed ?? this.countPracticed,
      questionGroup: questionGroup ?? this.questionGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'codeLesson': codeLesson,
      'title': title,
      'content': content,
      'idCategory': idCategory,
      'audioUrl': audioUrl,
      'timeCreated': timeCreated,
      'mark': mark,
      'countPracticed': countPracticed,
      'questionGroup': questionGroup.toMap(),
    };
  }

  factory DetailLesson.fromMap(Map<String, dynamic> map) {
    return DetailLesson(
      id: map['id'] as String,
      codeLesson: map['codeLesson'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      idCategory: map['idCategory'] as String,
      audioUrl: map['audioUrl'] != null ? map['audioUrl'] as String : null,
      timeCreated:
          map['timeCreated'] != null ? map['timeCreated'] as String : null,
      mark: map['mark'] != null ? map['mark'] as String : null,
      countPracticed:
          map['countPracticed'] != null ? map['countPracticed'] as int : null,
      questionGroup:
          QuestionGroup.fromMap(map['questionGroup'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailLesson.fromJson(String source) =>
      DetailLesson.fromMap(json.decode(source) as Map<String, dynamic>);
}
