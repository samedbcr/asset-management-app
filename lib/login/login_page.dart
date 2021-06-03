import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
//import 'package:personal_tool_bag/auth.dart';
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
            key: formKey,
            child: new Column(children: _buildInputs() + _buildButtons())),
      ),
    );
  }

  List<Widget> _buildInputs() {
    return [
      new TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(labelText: "Email"),
        validator: (value) => value.isEmpty ? "E-mail cant be empty" : null,
        onSaved: (value) => _email = value.toString(),
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: "Password"),
        validator: (value) => value.isEmpty ? "Password cant be empty" : null,
        onSaved: (value) => _password = value.toString(),
        obscureText: true,
      )
    ];
  }

  List<Widget> _buildButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          onPressed: validateAndSubmit,
          child: new Text(
            "Login",
            style: new TextStyle(fontSize: 20.0),
          ),
        ),
        new FlatButton(
          onPressed: moveToRegister,
          child: new Text(
            "create Account",
            style: new TextStyle(fontSize: 20),
          ),
        )
      ];
    } else {
      return [
        new RaisedButton(
          onPressed: validateAndSubmit,
          child: new Text(
            "Create an Account",
            style: new TextStyle(fontSize: 20.0),
          ),
        ),
        new FlatButton(
          onPressed: moveToLogin,
          child: new Text(
            "Have an Account? Login",
            style: new TextStyle(fontSize: 20),
          ),
        )
      ];
    }
  }
}
