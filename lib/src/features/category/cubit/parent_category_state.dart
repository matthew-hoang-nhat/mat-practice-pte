part of 'parent_category_cubit.dart';

class ParentCategoryState extends Equatable {
  const ParentCategoryState({
    required this.readingCategories,
    required this.listeningCategories,
  });
  final List<FCategory> readingCategories;
  final List<FCategory> listeningCategories;

  factory ParentCategoryState.init() =>
      const ParentCategoryState(listeningCategories: [], readingCategories: []);
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
