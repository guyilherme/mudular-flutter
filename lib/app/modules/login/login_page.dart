import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/login/login_controller.dart';
import 'package:teha/app/modules/login/login_module.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginModule.to.get<LoginController>();

  // _textField({String label, onEditingComplete, String Function() errorText}) {
  //   return TextField(
  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         labelText: label,
  //         errorText: errorText == null ? null : errorText()),
  //     onEditingComplete: onEditingComplete,
  //   );
  // }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      autofocus: true,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      autofocus: true,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Senha",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    // Observer(
                    //   builder: (_) {
                    //     return _textField(
                    //         label: "Login",
                    //         onEditingComplete: loginController.changeEmail,
                    //         errorText: loginController.validateEmail);
                    //   },
                    // ),
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
