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
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['Nome'] != null) {
      nome = json['Nome'];
    }
    if (json['created_at'] != null) {
      createdAt = json['created_at'];
    }
    if (json['updated_at'] != null) {
      updatedAt = json['updated_at'];
    }
    if (json['produtos'] != null) {
      produtos = new List<ProdutoModel>();
      json['produtos'].forEach((v) {
        produtos.add(new ProdutoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.nome != null) {
      data['Nome'] = this.nome;
    }
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt;
    }
    if (this.updatedAt != null) {
      data['updated_at'] = this.updatedAt;
    }
    if (this.produtos != null) {
      data['produtos'] = this.produtos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
