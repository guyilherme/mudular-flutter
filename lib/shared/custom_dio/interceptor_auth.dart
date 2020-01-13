import 'package:dio/dio.dart';
import 'package:teha/app/app_module.dart';
import 'package:teha/app/modules/login/login_controller.dart';
import 'package:teha/app/modules/login/login_module.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class AuthInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    LoginController auth = LoginModule.to.get<LoginController>();
    CustomDio dio = AppModule.to.get<CustomDio>();

    var jwt = auth.jwt;
    print(auth.jwt);
    if (jwt == null || jwt == '') {
      dio.client.lock();
      options.contentType = Headers.formUrlEncodedContentType;
      jwt = await auth.login(auth.email, auth.senha);

      options.headers.addAll({"Authorization": jwt});
      print('Chegou Aqui');

      dio.client.unlock();

      return options;
    } else {
      options.headers.addAll({"Authorization": jwt});

      return options;
    }
  }

  @override
  onResponse(Response response) {
    print("RESPONSE[${response.statusCode}] => PATH: ${response.request.path}");
    return super.onResponse(response);
  }

  @override
  Future<Response> onError(DioError err) {
    print("ERROR[${err.response.statusCode}] => PATH: ${err.request.path}");
    if (err.response?.statusCode == 401) {
      LoginController auth = LoginModule.to.get<LoginController>();
      CustomDio dio = AppModule.to.get<CustomDio>();

      RequestOptions options = err.response.request;

      if (auth.jwt != options.headers["Autorization"]) {
        options.headers["Autorization"] = auth.jwt;
        return dio.client.request(options.path, options: options);
      }

      dio.client.lock();
      dio.client.interceptors.responseLock.lock();
      dio.client.interceptors.errorLock.lock();

      return auth.login(auth.email, auth.senha).then((v) {
        options.headers["Autorization"] = v;
      }).whenComplete(() {
        dio.client.unlock();
        dio.client.interceptors.responseLock.unlock();
        dio.client.interceptors.errorLock.unlock();
      }).then((e) {
        return dio.client.request(options.path, options: options);
      });
    }
  }
}
