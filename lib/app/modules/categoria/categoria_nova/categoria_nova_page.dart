import 'package:flutter/material.dart';

class CategoriaNovaPage extends StatefulWidget {
  final String title;
  const CategoriaNovaPage({Key key, this.title = "Adicionar Nova Categoria"})
      : super(key: key);

  @override
  _CategoriaNovaPageState createState() => _CategoriaNovaPageState();
}

class _CategoriaNovaPageState extends State<CategoriaNovaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
