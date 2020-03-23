import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:teha/app/modules/categoria/categoria_nova/categoria_nova_controller.dart';
import 'package:toast/toast.dart';
import 'package:validators/validators.dart';

class CategoriaNovaPage extends StatefulWidget {
  final String title;
  const CategoriaNovaPage({Key key, this.title = "Adicionar Nova Categoria"})
      : super(key: key);

  @override
  _CategoriaNovaPageState createState() => _CategoriaNovaPageState();
}

class _CategoriaNovaPageState extends State<CategoriaNovaPage> {
  final categoriaController = CategoriaModule.to.get<CategoriaNovaController>();
  final _formNovaCategoria = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    categoriaController.setupValidations();
  }

  @override
  void dispose() {
    categoriaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formNovaCategoria,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) =>
                        categoriaController.nomeCategoria = value,
                    decoration: InputDecoration(
                        labelText: 'Nome Categoria',
                        hintText: 'Escolha um nome para a categoria',
                        errorText: categoriaController.error.nomeCategoria),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      categoriaController.validateAll();
                      if (!isNull(categoriaController.nomeCategoria) ||
                          categoriaController.nomeCategoria.isNotEmpty) {
                        categoriaController.changeNomeCategoria(
                            categoriaController.nomeCategoria);
                        categoriaController
                            .newCategoria(categoriaController.categoria)
                            .then((res) {
                          if (res.statusCode == 200) {
                            categoriaController.cancheCategoriaCadastrada(true);
                            Navigator.pop(context);
                          } else {
                            Toast.show(
                              "Ocorreu um erro. Tente novamente",
                              context,
                              duration: Toast.LENGTH_LONG,
                            );
                          }
                        });
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
