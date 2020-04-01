import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/categoria/categoria_editar/categoria_editar_controller.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';

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

  Observer field() {
    return Observer(builder: (_) {
      if (categoriaController.nomeCategoria.isNotEmpty) {
        TextEditingController textController =
            TextEditingController(text: categoriaController.nomeCategoria);
        textController.selection = textController.selection.copyWith(
            baseOffset: categoriaController.nomeCategoria.length,
            extentOffset: categoriaController.nomeCategoria.length);
        return TextField(
          controller: textController,
          onChanged: (value) => categoriaController.nomeCategoria = value,
          decoration: InputDecoration(
            labelText: 'Nome Categoria',
            hintText: 'Escolha um nome para a categoria',
          ),
        );
      } else {
        return TextField(
          onChanged: (value) => categoriaController.nomeCategoria = value,
          decoration: InputDecoration(
            labelText: 'Nome Categoria1',
            hintText: 'Escolha um nome para a categoria',
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formEditarCategoria,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Observer(builder: (_) {
                    if (categoriaController.nomeCategoria.isNotEmpty) {
                      TextEditingController textController =
                          TextEditingController(
                              text: categoriaController.nomeCategoria);
                      textController.selection = textController.selection
                          .copyWith(
                              baseOffset:
                                  categoriaController.nomeCategoria.length,
                              extentOffset:
                                  categoriaController.nomeCategoria.length);
                      return TextField(
                        controller: textController,
                        onChanged: (value) =>
                            categoriaController.nomeCategoria = value,
                        decoration: InputDecoration(
                          labelText: 'Nome Categoria',
                          hintText: 'Escolha um nome para a categoria',
                        ),
                      );
                    } else {
                      return TextField(
                        onChanged: (value) =>
                            categoriaController.nomeCategoria = value,
                        decoration: InputDecoration(
                          labelText: 'Nome Categoria1',
                          hintText: 'Escolha um nome para a categoria',
                        ),
                      );
                    }
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Observer(builder: (_) {
                      return Center(
                        child: SizedBox(
                          height: 54,
                          child: RaisedButton(
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: categoriaController.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text(
                                    "Cadastrar",
                                    textAlign: TextAlign.center,
                                  ),
                            color: Theme.of(context).primaryColor,
                            disabledColor:
                                Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed: categoriaController.isNomeCategoriaValid
                                ? () {
                                    categoriaController.changeNomeCategoria(
                                        categoriaController.nomeCategoria);
                                    categoriaController
                                        .changeCategoria(
                                            categoriaController.categoria)
                                        .then((res) {
                                      if (res.nome ==
                                          categoriaController.nomeCategoria) {
                                        categoriaController
                                            .cancheCategoriaCadastrada(true);
                                        Navigator.popAndPushNamed(
                                            context, "/categorias");
                                      } else {
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text(
                                                'Ocorreu um erro. Tente novamente')));
                                      }
                                    });
                                  }
                                : null,
                          ),
                        ),
                      );
                    }),
                    // child: RaisedButton(
                    //   onPressed: () {
                    //     categoriaController.validateAll();
                    //     if (!isNull(categoriaController.nomeCategoria) ||
                    //         categoriaController.nomeCategoria.isNotEmpty) {
                    //       categoriaController.changeNomeCategoria(
                    //           categoriaController.nomeCategoria);
                    //       categoriaController
                    //           .changeCategoria(categoriaController.categoria)
                    //           .then((res) {
                    //         if (res.statusCode == 200) {
                    //           categoriaController.cancheCategoriaCadastrada(true);
                    //           Navigator.popAndPushNamed(context, "/categorias");
                    //         } else {
                    //           Scaffold.of(context).showSnackBar(SnackBar(
                    //               content:
                    //                   Text('Ocorreu um erro. Tente novamente')));
                    //         }
                    //       });
                    //     }
                    //   },
                    //   child: Text('Cadastrar'),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
