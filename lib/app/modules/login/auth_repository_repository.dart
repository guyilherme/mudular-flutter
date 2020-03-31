import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:simple_gravatar/simple_gravatar.dart';
import 'package:teha/app/models/usuario/usuario_model.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class AuthRepositoryRepository extends Disposable {
  final CustomDio _dio;
  AuthRepositoryRepository(this._dio);
  Future<UsuarioModel> me() async {
    try {
      var response = await _dio.client.get("/api/v1/auth/me/");
      UsuarioModel user = UsuarioModel.fromJson(response.data);
      var gravatar = Gravatar(user.email);
      var url = gravatar.imageUrl(
        size: 100,
        defaultImage: GravatarImage.retro,
        rating: GravatarRating.pg,
        fileExtension: true,
      );
      user.imagem = url;
      return user;
    } on DioError catch (e) {
      throw (e.response.statusCode);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
