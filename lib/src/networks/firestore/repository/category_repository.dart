import '../../f_result.dart';
import '../../models/category/f_category.dart';

abstract class CategoryRepository {
  Future<FResult<List<FCategory>>> getCategories();
  Future<FResult<FCategory>> getCategory({required String id});
}
