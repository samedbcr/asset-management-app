import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/employees/employees_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:admin/login/auth.dart";
import 'components/side_menu.dart';

class Employees extends StatefulWidget {
  const Employees({Key key, this.auth, this.onSignedOut, this.userId})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(auth: widget.auth, onSignedOut: widget.onSignedOut),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(
                    auth: widget.auth, onSignedOut: widget.onSignedOut),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: EmployeesScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
