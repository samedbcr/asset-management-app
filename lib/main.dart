import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/login/login.dart';
import 'package:admin/screens/main/all_licenses.dart';
import 'package:admin/screens/main/assets.dart';
import 'package:admin/screens/main/dashboard.dart';
import 'package:admin/screens/main/order_requests.dart';
import 'package:admin/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/main/all_activities.dart';
import 'screens/main/all_employees.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      initialRoute: '/assets',
      routes: {
        '/': (context) => Login(),
        '/dashboard': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: Dashboard(),
            ),
        '/assets': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: Assets(),
            ),
        '/licenses': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: Licenses(),
            ),
        '/employees': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: Employees(),
            ),
        '/orderRequests': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: OrderRequests(),
            ),
        '/allActivities': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: AllActivities(),
            ),
      },
    );
  }
}
