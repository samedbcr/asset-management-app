import "package:flutter/material.dart";
import 'package:admin/home_page.dart';

import "login_page.dart";
import "auth.dart";

void main() {}

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => new RootPageState();
}

enum AuthStatus { notSignedIn, signedIn }

class RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;
  String userUid;

  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        _authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
        userUid = userId;
      });
    });
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        page = new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
        break;

      case AuthStatus.signedIn:
        page = new MyHomePage(
            auth: widget.auth, onSignedOut: signedOut, userId: userUid);
        break;
    }
    return page;
  }
}
