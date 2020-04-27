import 'package:flutter/material.dart';
import 'package:teha/app/modules/sidemenu/sidemenu_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: SidemenuWidget(
        context: context,
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Categoria"),
            onPressed: () {
              Navigator.pushNamed(context, "/categorias");
            },
          ),
          RaisedButton(
            child: Text("Produto"),
            onPressed: () {
              Navigator.pushNamed(context, "/produtos");
            },
          ),
        ],
      ),
    );
  }
}
