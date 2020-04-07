import 'package:dio/dio.dart';
import 'package:teha/app/modules/categoria/categoria_module.dart';
import 'package:teha/app/modules/sidemenu/sidemenu_controller.dart';
import 'package:teha/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:teha/app/app_widget.dart';
import 'package:teha/app/modules/login/login_module.dart';
import 'package:teha/app/navigator_service.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SidemenuController()),
        Bind((i) => AppController()),
        Bind((i) => Dio()),
        Bind((i) => CustomDio(i.get())),
        Bind((i) => NavigationService()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/categorias', module: CategoriaModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
