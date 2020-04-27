import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/login/login_controller.dart';
import 'package:teha/app/modules/login/login_module.dart';

class SidemenuWidget extends StatelessWidget {
  final String title;
  final BuildContext context;
  final LoginController loginController = LoginModule.to.get<LoginController>();

  SidemenuWidget({Key key, this.title, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Observer(builder: (_) {
            return UserAccountsDrawerHeader(
              accountName: Text(loginController.usuarioLogado.name),
              accountEmail: Text(loginController.usuarioLogado.email),
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundImage:
                    NetworkImage(loginController.usuarioLogado.imagem),
                backgroundColor: Colors.transparent,
              ),
            );
          }),
          ListTile(
            title: Text('Categorias'),
            onTap: () {
              Navigator.pushNamed(context, '/categorias');
            },
          ),
          ListTile(
            title: Text('Produtos'),
            onTap: () {
              Navigator.pushNamed(context, '/produtos');
            },
          ),
          ListTile(
            title: Text('Item 3'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
