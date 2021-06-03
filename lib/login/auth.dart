import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  FirebaseAuth instance = FirebaseAuth.instance;
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential user = await instance.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential user = await instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user.uid;
  }

  Future<String> currentUser() async {
    User user = instance.currentUser;
    return user.uid;
  }

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }
}
