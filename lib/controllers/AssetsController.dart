import 'package:cloud_firestore/cloud_firestore.dart';

class AssetsController {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _assetsCollection;

  AssetsController() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _assetsCollection = _firebaseFirestore.collection("assets");
  }

  Stream<QuerySnapshot> getAssets() {
    Query _assetsQuery = _assetsCollection.orderBy(FieldPath.documentId);
    return _assetsQuery.snapshots();
  }
}
