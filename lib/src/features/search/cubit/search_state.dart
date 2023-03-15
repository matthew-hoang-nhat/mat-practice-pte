import 'package:equatable/equatable.dart';

import 'package:mat_practice_pte/src/networks/models/category/f_category.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';

enum SearchTab {
  reading,
  listening;

  @override
  String toString() {
    switch (this) {
      case SearchTab.reading:
        return 'Reading';
      case SearchTab.listening:
        return 'Listening';
    }
  }
}

class SearchState extends Equatable {
  const SearchState({
    required this.lessons,
    required this.currenCategories,
    required this.tab,
    required this.selectedCategory,
    required this.isLoading,
  });
  final List<DetailLesson> lessons;

  final List<FCategory> currenCategories;
  final SearchTab tab;
  final FCategory? selectedCategory;
  final bool isLoading;

  factory SearchState.init() => const SearchState(
        tab: SearchTab.reading,
        lessons: [],
        currenCategories: [],
        selectedCategory: null,
        isLoading: false,
      );

  @override
  List<Object?> get props => [
        lessons,
        tab,
        currenCategories,
        selectedCategory,
        isLoading,
      ];

  SearchState copyWith({
    List<DetailLesson>? lessons,
    List<FCategory>? currenCategories,
    SearchTab? tab,
    FCategory? selectedCategory,
    bool? isLoading,
  }) {
    return SearchState(
      lessons: lessons ?? this.lessons,
      currenCategories: currenCategories ?? this.currenCategories,
      tab: tab ?? this.tab,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
