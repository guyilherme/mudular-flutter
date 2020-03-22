class ProdutoModel {
  int id;
  String codigo;
  String nome;
  String validade;
  String descricao;
  String createdAt;
  String updatedAt;
  int fornecedor;
  int apresentacao;
  int preco;

  ProdutoModel({
    this.id,
    this.codigo,
    this.nome,
    this.validade,
    this.descricao,
    this.createdAt,
    this.updatedAt,
    this.fornecedor,
    this.apresentacao,
    this.preco,
  });

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['Codigo'];
    nome = json['Nome'];
    validade = json['Validade'];
    descricao = json['Descricao'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fornecedor = json['fornecedor'];
    apresentacao = json['apresentacao'];
    preco = json['preco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Codigo'] = this.codigo;
    data['Nome'] = this.nome;
    data['Validade'] = this.validade;
    data['Descricao'] = this.descricao;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['fornecedor'] = this.fornecedor;
    data['apresentacao'] = this.apresentacao;
    data['preco'] = this.preco;
    return data;
  }
}
