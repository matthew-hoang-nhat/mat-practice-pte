import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/f_category.dart';

abstract class CategoryRepository {
  Future<FResult<List<FCategory>>> getCategories();
  Future<FResult<FCategory>> getCategory({required String id});
}
