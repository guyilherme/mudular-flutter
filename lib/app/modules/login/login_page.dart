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

  _textField(
      {String label, bool password, onChanged, String Function() errorText}) {
    return TextField(
      obscureText: password == true ? true : false,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: label,
          errorText: errorText == null ? null : errorText()),
      onChanged: onChanged,
    );
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          loginController.login(loginController.email, loginController.senha);
          if (loginController.logado == true) {
            Navigator.pushNamed(context, '/home');
          }
        },
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
                    // emailField,
                    Observer(
                      builder: (_) {
                        return _textField(
                            label: "Email",
                            onChanged: loginController.changeEmail,
                            errorText: loginController.validateEmail);
                      },
                    ),
                    SizedBox(height: 25.0),
                    Observer(
                      builder: (_) {
                        return _textField(
                            label: "Senha",
                            password: true,
                            onChanged: loginController.changeEmail,
                            errorText: loginController.validateEmail);
                      },
                    ),
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
