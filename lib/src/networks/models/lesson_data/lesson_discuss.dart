import 'package:freezed_annotation/freezed_annotation.dart';

import 'discuss_reaction.dart';

part 'lesson_discuss.freezed.dart';
part 'lesson_discuss.g.dart';

@freezed
class LessonDiscuss with _$LessonDiscuss {
  @JsonSerializable(explicitToJson: true)
  factory LessonDiscuss({
    required String idCategory,
    required String idLesson,
    String? idParent,
    required String content,
    required String uid,
    String? avatar,
    String? username,
    String? id,
    required List<DiscussReaction> reactions,
    required List<LessonDiscuss> replies,
  }) = _LessonDiscuss;

  factory LessonDiscuss.fromJson(Map<String, Object?> json) =>
      _$LessonDiscussFromJson(json);
}
