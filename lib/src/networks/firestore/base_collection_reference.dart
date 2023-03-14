import 'package:cloud_firestore/cloud_firestore.dart';

class BaseCollectionReference<T> {
  BaseCollectionReference(this.ref);
  final CollectionReference<T> ref;

  Future<bool> exist(String id) async {
    final documentSnapshot = await ref.doc(id).get();
    return documentSnapshot.exists;
  }

  Future<List<T>> getALl({CollectionReference<T>? optionRef}) async {
    QuerySnapshot<T> documentSnapshot;
    if (optionRef == null) {
      documentSnapshot = await ref.get();
    } else {
      documentSnapshot = await optionRef.get();
    }

    return documentSnapshot.docs.map((e) => e.data()).toList();
  }

  Future<T?> get(String id) async {
    final documentSnapshot = await ref.doc(id).get();
    if (documentSnapshot.exists) {
      return documentSnapshot.data()!;
    }
    return null;
  }

  Future<void> set(String id, T item) async {
    return ref.doc(id).set(item);
  }

  Future<void> delete(String id) async {
    return ref.doc(id).delete();
  }

  Stream<T> snapshots(String id) async* {
    final documentSnapshotStream = ref.doc(id).snapshots();
    await for (var snapshot in documentSnapshotStream) {
      yield snapshot.data()!;
    }
  }

  Future<void> add(T item) {
    return ref.add(item);
  }
}
