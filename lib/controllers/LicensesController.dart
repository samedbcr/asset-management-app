import 'package:cloud_firestore/cloud_firestore.dart';

class LicensesController {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _assetsCollection;

  LicensesController() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _assetsCollection = _firebaseFirestore.collection("licenses");
  }

  Stream<QuerySnapshot> getLicenses() {
    Query _assetsQuery = _assetsCollection.orderBy(FieldPath.documentId);
    return _assetsQuery.snapshots();
  }
}
