// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'show_bottom_definition_cubit.dart';

class ShowBottomDefinitionState extends Equatable {
  const ShowBottomDefinitionState({
    this.definition,
    this.isSaved,
  });

  factory ShowBottomDefinitionState.init() => const ShowBottomDefinitionState();

  final MWord? definition;
  final bool? isSaved;
  @override
  List<Object?> get props => [definition, isSaved];

  ShowBottomDefinitionState copyWith({
    Wrapper<bool>? isSaved,
    Wrapper<MWord>? definition,
  }) {
    return ShowBottomDefinitionState(
      isSaved: isSaved == null ? this.isSaved : isSaved.value,
      definition: definition == null ? this.definition : definition.value,
    );
  }
}
