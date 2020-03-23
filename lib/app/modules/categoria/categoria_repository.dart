import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class CategoriaRepository extends Disposable {
  final CustomDio _dio;
  CategoriaRepository(this._dio);
  Future<List<CategoriaModel>> getCategorias() async {
    List<CategoriaModel> categorias = new List<CategoriaModel>();
    try {
      var response = await _dio.client.get("/categorias");
      response.data.forEach((v) {
        categorias.add(new CategoriaModel.fromJson(v));
      });
      return categorias;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<dynamic> newCategorias(Map<String, dynamic> data) async {
    try {
      var response = await _dio.client.post("/categorias", data: data);
      return response;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
