part of 'drawer_cubit.dart';

class DrawerState extends Equatable {
  const DrawerState({
    required this.lessons,
    required this.idCategory,
    required this.mark,
    required this.practiced,
    required this.isIdDescending,
    required this.category,
    required this.isLoading,
  });
  final String idCategory;
  final List<DetailLesson> lessons;
  final FCategory? category;

  final bool isIdDescending;
  final String? mark;
  final String? practiced;
  final bool isLoading;

  @override
  List<Object?> get props =>
      [lessons, category, practiced, mark, isIdDescending, isLoading];

  DrawerState copyWith({
    List<DetailLesson>? lessons,
    String? idCategory,
    Wrapper<String>? mark,
    Wrapper<String>? practiced,
    FCategory? category,
    bool? isNew,
    bool? isLoading,
  }) {
    return DrawerState(
      lessons: lessons ?? this.lessons,
      idCategory: idCategory ?? this.idCategory,
      mark: mark == null ? this.mark : mark.value,
      practiced: practiced == null ? this.practiced : practiced.value,
      category: category ?? this.category,
      isIdDescending: isNew ?? isIdDescending,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class DrawerInitial extends DrawerState {
  const DrawerInitial({
    required super.lessons,
    required super.isIdDescending,
    required super.idCategory,
    required super.category,
    required super.practiced,
    required super.mark,
    required super.isLoading,
  });
}
