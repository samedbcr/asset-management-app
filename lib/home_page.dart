import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/login/login.dart';
import 'package:admin/screens/main/all_licenses.dart';
import 'package:admin/screens/main/assets.dart';
import 'package:admin/screens/main/dashboard.dart';
import 'package:admin/screens/main/order_requests.dart';
import 'package:admin/theme/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import "package:admin/login/auth.dart";
import 'screens/main/all_activities.dart';
import 'screens/main/all_employees.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.auth, this.onSignedOut, this.userId})
      : super(key: key);

  final String title = "HomePage";
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  // This widget is the root of your application.
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asset Management',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppConstants.backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: AppConstants.sidebarColor,
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child:
                  Dashboard(auth: widget.auth, onSignedOut: widget.onSignedOut),
            ),
        '/assets': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: Assets(auth: widget.auth, onSignedOut: widget.onSignedOut),
            ),
        '/licenses': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child:
                  Licenses(auth: widget.auth, onSignedOut: widget.onSignedOut),
            ),
        '/employees': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child:
                  Employees(auth: widget.auth, onSignedOut: widget.onSignedOut),
            ),
        '/orderRequests': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: OrderRequests(
                  auth: widget.auth, onSignedOut: widget.onSignedOut),
            ),
        '/allActivities': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: AllActivities(
                  auth: widget.auth, onSignedOut: widget.onSignedOut),
            ),
      },
    );
  }
}
