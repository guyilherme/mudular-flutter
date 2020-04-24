import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';

class DialogOrderWidget extends StatelessWidget {
  final controller;
  DialogOrderWidget(this.controller);
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SimpleDialog(
        title: Text("Selecione a ordenação"),
        children: [
          SwitchListTile(
              title: Text("Data de criação"),
              value: controller.buttomId,
              onChanged: (value) => controller.changeButtomId(value)),
          SwitchListTile(
              title: Text("Nome"),
              value: controller.buttomAz,
              onChanged: (value) => controller.changeButtomAz(value)),
          Divider(),
          Row(
            children: [
              Text("Asc"),
              Radio(
                  value: 'asc',
                  groupValue: controller.order,
                  onChanged: (value) {
                    controller.changeOrder(value);
                  }),
              Text("Desc"),
              Radio(
                  value: 'desc',
                  groupValue: controller.order,
                  onChanged: (value) {
                    controller.changeOrder(value);
                  }),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: [
              FlatButton(
                child: Text('Fechar'),
                onPressed: () {
                  controller.changeButtomId(false);
                  controller.changeButtomAz(false);
                  controller.changeColumnOrder('id');
                  controller.changeOrder('asc');
                  controller.changeCategoriasLista(<CategoriaModel>[]);
                  controller.getCategorias(
                      page: controller.lastPage,
                      columnOrder: controller.columnOrder,
                      order: controller.order);
                  Navigator.pop(context, true);
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/categorias', ModalRoute.withName('/home'));
                },
              ),
              FlatButton(
                child: Text('Aplicar'),
                onPressed: () {
                  if (controller.buttomId) {
                    controller.changeColumnOrder('id');
                  }
                  if (controller.buttomAz) {
                    controller.changeColumnOrder('nome');
                  }
                  controller.changeCategoriasLista(<CategoriaModel>[]);
                  controller.getCategorias(
                      page: controller.lastPage,
                      columnOrder: controller.columnOrder,
                      order: controller.order);
                  Navigator.pop(context, true);
                },
              ),
            ],
          )
        ],
      );
    });
  }
}
