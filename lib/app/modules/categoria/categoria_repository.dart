import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class CategoriaRepository extends Disposable {
  final CustomDio _dio;
  CategoriaRepository(this._dio);
  Future<List<CategoriaModel>> getCategorias(
      {int page = 1, String columnOrder = "id", String order = "asc"}) async {
    final categoriaController = CategoriaModule.to.get<CategoriaController>();
    String url;

    try {
      if (columnOrder.isNotEmpty && order.isNotEmpty) {
        url = "/api/v1/categorias/?page=" +
            page.toString() +
            "&order=" +
            columnOrder.toString() +
            "," +
            order.toString();
      }
      var response = await _dio.client.get(url);
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

  Future<CategoriaModel> newCategoria(Map<String, dynamic> data) async {
    print(data);
    try {
      var response = await _dio.client.post("/api/v1/categorias/", data: data);
      return CategoriaModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.response.statusCode);
    }
  }

  Future<CategoriaModel> editCategoria(
      {int id, Map<String, dynamic> data}) async {
    try {
      var response = await _dio.client
          .patch("/api/v1/categorias/" + id.toString(), data: data);
      return CategoriaModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.response.statusCode);
    }
  }

  Future<CategoriaModel> deleteCategoria({int id}) async {
    try {
      var response =
          await _dio.client.delete("/api/v1/categorias/" + id.toString());
      return CategoriaModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.response.statusCode);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
