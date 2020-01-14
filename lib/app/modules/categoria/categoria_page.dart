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
    // TODO: implement initState
    super.initState();
    loginController.getCategorias();
    sort = false;
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        loginController.categoriasLista.data
            .sort((a, b) => a.nome.compareTo(b.nome));
      } else {
        loginController.categoriasLista.data
            .sort((a, b) => b.nome.compareTo(a.nome));
      }
    }
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
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
            label: Text("Atualizado"),
            numeric: false,
            tooltip: "Ultima Atualização",
          ),
        ],
        rows: loginController.categoriasLista.data
            .map(
              (categoria) => DataRow(
                  onSelectChanged: (b) {
                    print("Onselect");
                  },
                  cells: [
                    DataCell(
                      Text(categoria.nome),
                      onTap: () {
                        print('Selected ${categoria.nome}');
                      },
                    ),
                    DataCell(
                      Text(categoria.updatedAt),
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
      // body: Observer(
      //     builder: (_) => (loginController.categoriasLista != null)
      //         ? ListView.builder(
      //             itemCount: loginController.categoriasLista.data.length,
      //             itemBuilder: (_, index) {
      //               final listaCategorias =
      //                   loginController.categoriasLista.data[index];
      //               return Card(
      //                 child: ListTile(
      //                   title: Text(listaCategorias.nome),
      //                   onTap: () {
      //                     print(listaCategorias.id);
      //                     print(listaCategorias.nome);
      //                   },
      //                 ),
      //               );
      //             })
      //         : Center(
      //             child: CircularProgressIndicator(),
      //           )),
    );
  }
}
