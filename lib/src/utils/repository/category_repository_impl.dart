import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/f_category.dart';
import 'package:mat_practice_pte/src/utils/repository/category_repository.dart';
import '../reference/category_collection_reference.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final ref = CategoryCollectionReference();

  @override
  Future<FResult<List<FCategory>>> getCategories() async {
    try {
      final categories = await ref.getALl();
      return FResult.success(categories);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<FCategory>> getCategory({required String id}) async {
    try {
      final category = await ref.get(id);
      return FResult.success(category);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
