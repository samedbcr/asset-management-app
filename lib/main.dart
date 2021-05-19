import 'package:flutter/material.dart';

import 'login/login.dart';
import 'pages/all_activities.dart';
import 'pages/assets.dart';
import 'pages/dashboard.dart';
import 'pages/employees.dart';
import 'pages/licenses.dart';
import 'pages/order_requests.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/assets': (context) => Assets(),
        '/licenses': (context) => Licenses(),
        '/employees': (context) => Employees(),
        '/order_requests': (context) => OrderRequests(),
        '/all_activities': (context) => AllActivities(),
      },
    );
  }
}
