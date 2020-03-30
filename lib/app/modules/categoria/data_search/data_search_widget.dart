import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
                  print(snapshot.data[index].nome);
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
