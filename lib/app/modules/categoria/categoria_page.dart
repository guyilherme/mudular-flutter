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
  bool sort;

  @override
  void initState() {
    super.initState();
    loginController.getCategorias();
    sort = false;
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        loginController.categoriasLista
            .sort((a, b) => a.nome.compareTo(b.nome));
      } else {
        loginController.categoriasLista
            .sort((a, b) => b.nome.compareTo(a.nome));
      }
    }
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 1,
        columns: [
          DataColumn(
            label: Text("ID"),
            numeric: true,
            tooltip: "Identificação da Categoria",
          ),
          DataColumn(
              label: Text("Nome"),
              numeric: false,
              tooltip: "Nome da Categoria",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("Ações"),
            numeric: false,
            tooltip: "Ações",
          ),
        ],
        rows: loginController.categoriasLista
            .map(
              (categoria) => DataRow(cells: [
                DataCell(
                  Text('${categoria.id}'),
                ),
                DataCell(
                  Text(categoria.nome),
                  onTap: () {
                    print('Selected ${categoria.nome}');
                  },
                ),
                DataCell(
                  Icon(Icons.edit),
                  onTap: () {
                    print('Selected ${categoria.id}');
                  },
                ),
              ]),
            )
            .toList(),
      ),
    );
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
              Navigator.pushNamed(context, "/categorias/new");
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
                builder: (_) => (loginController.categoriasLista != null)
                    ? dataBody()
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
          )
        ],
      ),
    );
  }
}
