import 'package:dio/dio.dart';
import 'package:teha/shared/custom_dio/constants.dart';
import 'package:teha/shared/custom_dio/interceptor_auth.dart';
import 'package:teha/shared/custom_dio/interceptors.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.baseUrl = BASE_URL;
    client.interceptors.add(CustomInterceptors());
    client.interceptors.add(AuthInterceptors());
    client.options.connectTimeout = 5000;
    client.options.contentType = Headers.formUrlEncodedContentType;
  }
}
