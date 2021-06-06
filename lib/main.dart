import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login/root_page.dart';
import 'login/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData.dark(),
      home: new RootPage(auth: new Auth()),
    );
  }
}
