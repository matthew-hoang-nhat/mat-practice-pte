part of 'comment_cubit.dart';

enum ReactionComments {
  like;

  @override
  String toString() {
    switch (this) {
      case ReactionComments.like:
        return 'Like';
    }
  }
}

class CommentState extends Equatable {
  const CommentState({
    required this.idLesson,
    required this.lessonDiscusses,
  });

  final String idLesson;
  final List<LessonDiscuss> lessonDiscusses;

  @override
  List<Object?> get props => [
        lessonDiscusses,
        idLesson,
      ];

  factory CommentState.init() => const CommentState(
        lessonDiscusses: [],
        idLesson: '',
      );

  CommentState copyWith({
    String? idLesson,
    List<LessonDiscuss>? discusses,
  }) {
    return CommentState(
      idLesson: idLesson ?? this.idLesson,
      lessonDiscusses: discusses ?? lessonDiscusses,
    );
  }
}
