// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    required this.isLightMode,
    required this.categories,
  });
  final bool isLightMode;
  final List<FCategory> categories;

  factory AppState.init() => const AppState(isLightMode: true, categories: []);

  @override
  List<Object> get props => [isLightMode, categories];

  AppState copyWith({
    bool? isLightMode,
    List<FCategory>? categories,
  }) {
    return AppState(
      isLightMode: isLightMode ?? this.isLightMode,
      categories: categories ?? this.categories,
    );
  }
}
