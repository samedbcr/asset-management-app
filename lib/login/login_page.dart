import 'package:admin/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "auth.dart";

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.auth, this.onSignedIn})
      : super(key: key);
  final BaseAuth auth;
  final String title;
  final VoidCallback onSignedIn;

  //final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool _validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void moveToRegister() {
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    setState(() {
      _formType = FormType.login;
    });
  }

  void validateAndSubmit() async {
    if (_validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
        }
        widget.onSignedIn();
      } catch (e) {
        print("error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: AppConstants.sidebarColor,
            ),
            SingleChildScrollView(
              child: Align(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  alignment: Alignment.center,
                  width: 375,
                  height: 812,
                  color: AppConstants.backgroundColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Text(
                          "LOGIN",
                          style: CustomTextHeadline.headLine3,
                        ),
                      ),
                      SvgPicture.asset("assets/iconsv1/login.svg"),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(16.0),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              color: AppConstants.sidebarColor,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                    new InputDecoration(labelText: "Email"),
                                validator: (value) => value.isEmpty
                                    ? "E-mail cant be empty"
                                    : null,
                                onSaved: (value) => _email = value.toString(),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(16.0),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              color: AppConstants.sidebarColor,
                              child: TextFormField(
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) => value.isEmpty
                                    ? "Password cant be empty"
                                    : null,
                                onSaved: (value) =>
                                    _password = value.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 350,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: AppConstants.sidebarColor),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: validateAndSubmit,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
