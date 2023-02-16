import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/f_category.dart';
import 'package:mat_practice_pte/src/utils/repository/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final database = GlobalVariables.firestore;
  @override
  Future<FResult<List<FCategory>>> getCategories() async {
    try {
      final result = await database.collection('categories').get();
      final categories = <FCategory>[];
      for (var doc in result.docs) {
        final itemData = doc.data();
        categories.add(FCategory.fromMap(itemData));
      }
      return FResult.success(categories);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<FCategory>> getCategory({required String id}) async {
    try {
      final result = await database.collection('categories').doc(id).get();
      final category = FCategory.fromMap(result.data()!);
      return FResult.success(category);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
