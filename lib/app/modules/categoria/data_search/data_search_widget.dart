import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teha/app/app_module.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class DataSearch extends SearchDelegate<String> {
  final categoriaController = CategoriaModule.to.get<CategoriaController>();
  final _dio = AppModule.to.get<CustomDio>();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchCategorias(nome: query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index].nome),
                subtitle: Text(snapshot.data[index].createdAt),
                leading: Icon(Icons.list),
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, "/categorias/edit/${snapshot.data[index].id}");
                },
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Excluir ${snapshot.data[index].nome} ?"),
                      content: Text(
                          'Você tem certeza que quer excluir a categoria ${snapshot.data[index].nome} ?'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: new Text('Não'),
                        ),
                        FlatButton(
                          onPressed: () {
                            categoriaController
                                .deleteCategoria(id: snapshot.data[index].id)
                                .then((value) {
                              if (value.id == snapshot.data[index].id) {
                                Navigator.popAndPushNamed(
                                    context, "/categorias");
                              }
                            });
                          },
                          child: new Text('Sim'),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            itemCount: snapshot.data.length,
          );
        }
      },
    );
  }

  Future searchCategorias({String nome, int page = 1}) async {
    if (nome != "") {
      try {
        var response = await _dio.client.get("/api/v1/categorias/?page=" +
            page.toString() +
            "&order=nome,asc&like[nome]=" +
            nome);
        return (response.data['data'] as List)
            .map((e) => CategoriaModel.fromJson(e))
            .toList();
      } on DioError catch (e) {
        throw (e.response.statusCode);
      }
    }
  }
}
