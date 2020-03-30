import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:teha/app/modules/categoria/categoria_nova/categoria_nova_controller.dart';
import 'package:teha/app/modules/categoria/data_search/data_search_widget.dart';

class CategoriaPage extends StatefulWidget {
  final String title;
  const CategoriaPage({Key key, this.title = "Categoria"}) : super(key: key);

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  final categoriaController = CategoriaModule.to.get<CategoriaController>();
  ScrollController _scrollController = new ScrollController();
  final novaCategoriaController =
      CategoriaModule.to.get<CategoriaNovaController>();
  bool sort;
  int page = 1;

  @override
  void initState() {
    super.initState();
    categoriaController.getCategorias(page: page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          page < categoriaController.lastPage) {
        setState(() {
          page = page + 1;
        });
        categoriaController.getCategorias(page: page);
      }
    });
  }

  Observer dataBody() {
    return Observer(builder: (_) {
      if (categoriaController.categoriasLista.isNotEmpty) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: categoriaController.categoriasLista.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text(
                        "${categoriaController.categoriasLista[index].nome}"),
                    subtitle: Text(
                        "Criado em ${categoriaController.categoriasLista[index].createdAt}"),
                    trailing: GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: () {
                        Navigator.pushReplacementNamed(context,
                            "/categorias/edit/${categoriaController.categoriasLista[index].id}");
                      },
                    ),
                  )
                ],
              ),
            );
          },
        );
      } else {
        return Text("Não existem categorias cadastradas");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.note_add),
            tooltip: 'Nova Categoria',
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/categorias/new");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: Observer(
                builder: (_) => (categoriaController.categoriasLista != null)
                    ? dataBody()
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
          ),
        ],
      ),
    );
  }
}
