import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:admin/login/auth.dart";

class SideMenu extends StatefulWidget {
  const SideMenu({Key key, this.auth, this.onSignedOut, this.userId})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  void _signOut() async {
    try {
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "Cross - Platform",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/iconsv1/dashboard.svg",
              press: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            DrawerListTile(
              title: "Assets",
              svgSrc: "assets/iconsv1/assets.svg",
              press: () {
                Navigator.pushNamed(context, '/assets');
              },
            ),
            DrawerListTile(
              title: "Licenses",
              svgSrc: "assets/iconsv1/license.svg",
              press: () {
                Navigator.pushNamed(context, '/licenses');
              },
            ),
            DrawerListTile(
              title: "Employees",
              svgSrc: "assets/iconsv1/employee.svg",
              press: () {
                Navigator.pushNamed(context, '/employees');
              },
            ),
            DrawerListTile(
              title: "Order Requests",
              svgSrc: "assets/iconsv1/orderRequest.svg",
              press: () {
                Navigator.pushNamed(context, '/orderRequests');
              },
            ),
            DrawerListTile(
              title: "All Activities",
              svgSrc: "assets/iconsv1/activity.svg",
              press: () {
                Navigator.pushNamed(context, '/allActivities');
              },
            ),
            DrawerListTile(
              title: "Logout",
              svgSrc: "assets/iconsv1/dashboard.svg",
              press: () {
                _signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
