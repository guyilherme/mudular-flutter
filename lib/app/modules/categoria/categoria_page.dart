import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:teha/app/modules/categoria/categoria_nova/categoria_nova_controller.dart';
import 'package:teha/app/modules/categoria/data_search/data_search_widget.dart';
import 'package:teha/app/widgets/dialog_order/dialog_order_widget.dart';

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
  Offset position = Offset(20.0, 20.0);

  @override
  void initState() {
    super.initState();
    categoriaController.changeCategoriasLista(<CategoriaModel>[]);
    categoriaController.getCategorias(
        page: categoriaController.page,
        columnOrder: categoriaController.columnOrder,
        order: categoriaController.order);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          categoriaController.page < categoriaController.lastPage) {
        categoriaController.changePage();
        categoriaController.getCategorias(
            page: categoriaController.page,
            columnOrder: categoriaController.columnOrder,
            order: categoriaController.order);
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
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              "Excluir ${categoriaController.categoriasLista[index].nome} ?"),
                          content: Text(
                              'Você tem certeza que quer excluir a categoria ${categoriaController.categoriasLista[index].nome} ?'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: new Text('Não'),
                            ),
                            FlatButton(
                              onPressed: () {
                                categoriaController
                                    .deleteCategoria(
                                        id: categoriaController
                                            .categoriasLista[index].id)
                                    .then((value) {
                                  if (value.id ==
                                      categoriaController
                                          .categoriasLista[index].id) {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/categorias',
                                        ModalRoute.withName('/home'));
                                  }
                                });
                              },
                              child: new Text('Sim'),
                            )
                          ],
                        ),
                      );
                    },
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
          Ink(
            decoration: ShapeDecoration(
                shape: CircleBorder(), color: Theme.of(context).primaryColor),
            child: IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) =>
                        DialogOrderWidget(categoriaController));
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.note_add),
            tooltip: 'Nova Categoria',
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/categorias/new");
            },
          ),
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
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.search),
          onPressed: () async {
            await showSearch(context: context, delegate: DataSearch());
          },
        ),
      ),
    );
  }
}
