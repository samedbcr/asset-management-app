import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRequestsController {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _assetsCollection;

  OrderRequestsController() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _assetsCollection = _firebaseFirestore.collection("order_requests");
  }

  Stream<QuerySnapshot> getOrderRequets() {
    Query _assetsQuery = _assetsCollection.orderBy(FieldPath.documentId);
    return _assetsQuery.snapshots();
  }
}
