import 'package:flutter/material.dart';

class SidemenuWidget extends StatelessWidget {
  final String title;
  final BuildContext context;

  SidemenuWidget({Key key, this.title, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text('Categorias'),
            onTap: () {
              Navigator.pushNamed(context, '/categorias');
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
