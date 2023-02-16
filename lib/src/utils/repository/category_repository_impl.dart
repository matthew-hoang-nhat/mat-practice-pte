import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/utils/base_collection_reference.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/f_category.dart';
import 'package:mat_practice_pte/src/utils/repository/category_repository.dart';

class CategoryRepositoryImpl extends BaseCollectionReference<FCategory>
    implements CategoryRepository {
  CategoryRepositoryImpl(FirebaseFirestore firestore)
      : super(
          firestore
              .collection(FirebaseCollectionNames.categories)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    FCategory.fromMap(snapshot.data()!),
                toFirestore: (value, options) => value.toMap(),
              ),
        );

  @override
  Future<FResult<List<FCategory>>> getCategories() async {
    try {
      final result = await ref.get();
      final categories = result.docs.map((e) => e.data()).toList();
      return FResult.success(categories);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<FCategory>> getCategory({required String id}) async {
    try {
      final category = await get(id);
      return FResult.success(category);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
