import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/login/login_controller.dart';
import 'package:teha/app/modules/login/login_module.dart';
import 'package:teha/app/widgets/custom_icon_button/custom_icon_button_widget.dart';
import 'package:teha/app/widgets/custom_text_field/custom_text_field_widget.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final loginController = LoginModule.to.get<LoginController>();

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                    CustomTextFieldWidget(
                      hint: 'E-mail',
                      prefix: Icon(Icons.account_circle),
                      textInputType: TextInputType.emailAddress,
                      onChanged: loginController.changeEmail,
                      enabled: true,
                    ),
                    SizedBox(height: 25.0),
                    CustomTextFieldWidget(
                      hint: 'Senha',
                      prefix: Icon(Icons.lock),
                      obscure: !loginController.mostrarSenha,
                      onChanged: loginController.changeSenha,
                      enabled: true,
                      suffix: CustomIconButtonWidget(
                        radius: 32,
                        iconData: Icons.visibility,
                        onTap: loginController.setMostrarSenha,
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 54,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: loginController.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text("Login",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          textColor: Colors.white,
                          onPressed: loginController.isFormValid
                              ? () {
                                  loginController
                                      .login(loginController.email,
                                          loginController.senha)
                                      .then((e) {
                                    if (loginController.logado == true) {
                                      print(e);
                                      Navigator.popAndPushNamed(
                                          context, '/home');
                                    }
                                  }).catchError((e) {
                                    print(e);
                                    _scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text('Login Incorreto'),
                                      duration: Duration(seconds: 3),
                                    ));
                                  });
                                }
                              : null,
                        ),
                      );
                    }),
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
