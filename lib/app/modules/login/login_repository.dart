import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teha/shared/custom_dio/constants.dart';
import 'package:teha/shared/custom_dio/interceptors.dart';

class LoginRepository extends Disposable {
  Dio _dio;

  LoginRepository() {
    _dio = Dio();
    _dio.options.baseUrl = BASE_URL;
    _dio.interceptors.add(CustomInterceptors());
  }

  Future<Map> login(Map<String, dynamic> data) async {
    try {
      _dio.options.contentType = Headers.formUrlEncodedContentType;
      var res = await _dio.post(TOKEN_END_POINT, data: data);
      return res.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
