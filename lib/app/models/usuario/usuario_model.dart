class UsuarioModel {
  int id;
  String name;
  String email;
  String tipo;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
  String imagem;
  UsuarioModel(
      {this.id,
      this.name,
      this.email,
      this.tipo,
      this.imagem,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      tipo: json['tipo'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
