class CategoriaModel {
  int id;
  String nome;
  String createdAt;
  String updatedAt;

  CategoriaModel({this.id, this.nome, this.createdAt, this.updatedAt});

  CategoriaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.nome != null) {
      data['nome'] = this.nome;
    }
    return data;
  }
}
