import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/categoria/categoria_editar/categoria_editar_controller.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:validators/validators.dart';

class CategoriaEditarPage extends StatefulWidget {
  final String title;
  final String id;
  const CategoriaEditarPage({Key key, this.title = "Editar Categoria", this.id})
      : super(key: key);

  @override
  _CategoriaEditarPageState createState() => _CategoriaEditarPageState();
}

class _CategoriaEditarPageState extends State<CategoriaEditarPage> {
  final categoriaController =
      CategoriaModule.to.get<CategoriaEditarController>();
  final _formEditarCategoria = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    categoriaController.getCategoria(id: int.parse(widget.id));
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
            key: _formEditarCategoria,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Observer(
                  builder: (_) => TextField(
                    controller: TextEditingController()
                      ..text = categoriaController.nomeCategoria,
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
                            .changeCategoria(categoriaController.categoria)
                            .then((res) {
                          if (res.statusCode == 200) {
                            categoriaController.cancheCategoriaCadastrada(true);
                            Navigator.popAndPushNamed(context, "/categorias");
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Ocorreu um erro. Tente novamente')));
                          }
                        });
                      }
                    },
                    child: Text('Cadastrar'),
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
