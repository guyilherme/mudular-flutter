import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:teha/app/models/categoria/categoriaLista_model.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class CategoriaRepository extends Disposable {
  final CustomDio _dio;
  CategoriaRepository(this._dio);
  Future<CategoriaListaModel> getCategorias() async {
    try {
      var response = await _dio.client.get("/api/v1/categorias/");
      return CategoriaListaModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
