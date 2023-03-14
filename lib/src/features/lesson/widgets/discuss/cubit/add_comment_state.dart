// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_comment_cubit.dart';

class AddCommentState extends Equatable {
  const AddCommentState({
    required this.isLoading,
  });
  final bool isLoading;
  @override
  List<Object?> get props => [isLoading];

  factory AddCommentState.init() => const AddCommentState(
        isLoading: false,
      );

  AddCommentState copyWith({
    bool? isLoading,
  }) {
    return AddCommentState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
