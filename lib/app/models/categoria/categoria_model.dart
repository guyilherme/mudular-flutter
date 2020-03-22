import 'package:teha/app/models/produto/produtos_model.dart';

class CategoriaModel {
  int id;
  String nome;
  String createdAt;
  String updatedAt;
  List<ProdutoModel> produtos;

  CategoriaModel({
    this.id,
    this.nome,
    this.createdAt,
    this.updatedAt,
    this.produtos,
  });

  CategoriaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['Nome'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['produtos'] != null) {
      produtos = new List<ProdutoModel>();
      json['produtos'].forEach((v) {
        produtos.add(new ProdutoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Nome'] = this.nome;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.produtos != null) {
      data['produtos'] = this.produtos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
