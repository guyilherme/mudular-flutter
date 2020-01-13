import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';

class CategoriaPage extends StatefulWidget {
  final String title;
  const CategoriaPage({Key key, this.title = "Categoria"}) : super(key: key);

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  final loginController = CategoriaModule.to.get<CategoriaController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController.getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
          builder: (_) => (loginController.categoriasLista != null)
              ? ListView.builder(
                  itemCount: loginController.categoriasLista.data.length,
                  itemBuilder: (_, index) {
                    final listaCategorias =
                        loginController.categoriasLista.data[index];
                    return Card(
                      child: ListTile(
                        title: Text(listaCategorias.nome),
                        onTap: () {
                          print(listaCategorias.id);
                          print(listaCategorias.nome);
                        },
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
