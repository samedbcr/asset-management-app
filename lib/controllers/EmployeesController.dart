import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeesController {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _assetsCollection;

  EmployeesController() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _assetsCollection = _firebaseFirestore.collection("employees");
  }

  Stream<QuerySnapshot> getEmployees() {
    Query _assetsQuery = _assetsCollection.orderBy(FieldPath.documentId);
    return _assetsQuery.snapshots();
  }
}
