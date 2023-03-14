import 'package:freezed_annotation/freezed_annotation.dart';
part 'f_category.freezed.dart';
part 'f_category.g.dart';

@freezed
class FCategory with _$FCategory {
  factory FCategory({
    required String id,
    required String name,
    required String codeName,
    required String hexCodeColor,
    required int foundLesson,
  }) = _FCategory;

  factory FCategory.fromJson(Map<String, Object?> json) =>
      _$FCategoryFromJson(json);
}
