import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:teha/app/modules/categoria/categoria_nova/categoria_nova_controller.dart';
import 'package:teha/app/widgets/custom_text_field/campo_padrao.dart';

class CategoriaNovaPage extends StatefulWidget {
  final String title;
  const CategoriaNovaPage({Key key, this.title = "Adicionar Nova Categoria"})
      : super(key: key);

  @override
  _CategoriaNovaPageState createState() => _CategoriaNovaPageState();
}

class _CategoriaNovaPageState extends State<CategoriaNovaPage> {
  final categoriaNovaController =
      CategoriaModule.to.get<CategoriaNovaController>();
  final _formNovaCategoria = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/categorias");
            }),
      ),
      body: Column(
        children: <Widget>[
          Observer(builder: (_) {
            return Form(
              key: _formNovaCategoria,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CampoPadrao(
                    label: 'Nome Categoria',
                    onChanged: categoriaNovaController.setNome,
                    hintText: 'Escolha um nome para a categoria',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      height: 54,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Text(
                          "Cadastrar",
                          textAlign: TextAlign.center,
                        ),
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        onPressed: categoriaNovaController.isnomeCategoriaValid
                            ? () {
                                categoriaNovaController.changeNomeCategoria();
                                categoriaNovaController
                                    .newCategoria(
                                        categoriaNovaController.categoria)
                                    .then((res) {
                                  if (res.nome ==
                                      categoriaNovaController.nomeCategoria) {
                                    categoriaNovaController
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
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
