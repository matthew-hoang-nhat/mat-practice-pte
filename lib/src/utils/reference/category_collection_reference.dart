import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/utils/base_collection_reference.dart';
import 'package:mat_practice_pte/src/utils/remote/models/f_category.dart';

class CategoryCollectionReference extends BaseCollectionReference<FCategory> {
  CategoryCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection(FirebaseCollectionNames.categories)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    FCategory.fromMap(snapshot.data()!),
                toFirestore: (value, options) => value.toMap(),
              ),
        );
}
