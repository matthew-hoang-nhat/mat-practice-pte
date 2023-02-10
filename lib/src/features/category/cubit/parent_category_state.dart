// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'parent_category_cubit.dart';

class ParentCategoryState extends Equatable {
  const ParentCategoryState({
    required this.readingCategories,
    required this.listeningCategories,
  });
  final List<FCategory> readingCategories;
  final List<FCategory> listeningCategories;

  @override
  List<Object> get props => [readingCategories, listeningCategories];

  ParentCategoryState copyWith({
    List<FCategory>? readingCategories,
    List<FCategory>? listeningCategories,
  }) {
    return ParentCategoryState(
      readingCategories: readingCategories ?? this.readingCategories,
      listeningCategories: listeningCategories ?? this.listeningCategories,
    );
  }
}

class ParentCategoryInitial extends ParentCategoryState {
  const ParentCategoryInitial(
      {required super.readingCategories, required super.listeningCategories});
}
