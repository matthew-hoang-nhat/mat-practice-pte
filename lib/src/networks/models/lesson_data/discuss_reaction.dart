import 'package:freezed_annotation/freezed_annotation.dart';
part 'discuss_reaction.freezed.dart';
part 'discuss_reaction.g.dart';

@freezed
class DiscussReaction with _$DiscussReaction {
  factory DiscussReaction({
    required String uid,
    required String reaction,
  }) = _DiscussReaction;

  factory DiscussReaction.fromJson(Map<String, Object?> json) =>
      _$DiscussReactionFromJson(json);
}
