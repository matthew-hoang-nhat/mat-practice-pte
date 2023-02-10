// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MUserPractice {
  final int todayPracticed;
  final int totalPracticed;
  final int pracDays;

  MUserPractice({
    this.todayPracticed = 0,
    this.totalPracticed = 0,
    this.pracDays = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todayPracticed': todayPracticed,
      'totalPracticed': totalPracticed,
      'pracDays': pracDays,
    };
  }

  factory MUserPractice.fromMap(Map<String, dynamic> map) {
    return MUserPractice(
      todayPracticed: map['todayPracticed'] as int,
      totalPracticed: map['totalPracticed'] as int,
      pracDays: map['pracDays'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MUserPractice.fromJson(String source) =>
      MUserPractice.fromMap(json.decode(source) as Map<String, dynamic>);
}
