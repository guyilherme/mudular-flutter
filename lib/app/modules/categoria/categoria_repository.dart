import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class CategoriaRepository extends Disposable {
  final CustomDio _dio;
  CategoriaRepository(this._dio);
  Future<List<CategoriaModel>> getCategorias({int page = 1}) async {
    final categoriaController = CategoriaModule.to.get<CategoriaController>();
    try {
      var response =
          await _dio.client.get("/api/v1/categorias/?page=" + page.toString());
      categoriaController.changeLastPage(response.data['last_page']);
      return (response.data['data'] as List)
          .map((e) => CategoriaModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw (e.response.statusCode);
    }
  }

  Future<CategoriaModel> getCategoria({int id}) async {
    try {
      var response =
          await _dio.client.get("/api/v1/categorias/" + id.toString());
      return CategoriaModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.response.statusCode);
    }
  }

  Future<dynamic> newCategoria(Map<String, dynamic> data) async {
    print(data);
    try {
      var response = await _dio.client.post("/api/v1/categorias/", data: data);
      return response;
    } on DioError catch (e) {
      throw (e.response.statusCode);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
