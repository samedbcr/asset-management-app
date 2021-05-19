import 'package:asset_management_app/sidebar/side_menu.dart';
import 'package:asset_management_app/theme/constants.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: AppConstants.backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
