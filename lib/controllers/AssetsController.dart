import 'package:cloud_firestore/cloud_firestore.dart';

class AssetsController {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _assetsCollection;

  AssetsController() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _assetsCollection = _firebaseFirestore.collection("assets");
  }
  Stream<QuerySnapshot> getAssets() {
    Query _assetsQuery = _assetsCollection
        .orderBy(FieldPath.documentId)
        .where('is_deleted', isEqualTo: false);
    return _assetsQuery.snapshots();
  }

  Future<void> deleteUser(DocumentReference reference) {
    Map<String, dynamic> data = {'is_deleted': true};
    return reference.update(data);
  }
}
