import 'package:teha/app/modules/categoria/data_search/data_search_controller.dart';
import 'package:teha/app/modules/categoria/categoria_editar/categoria_editar_controller.dart';
import 'package:teha/app/modules/categoria/categoria_editar/categoria_editar_page.dart';
import 'package:teha/app/modules/categoria/categoria_nova/categoria_nova_controller.dart';
import 'package:teha/app/app_module.dart';
import 'package:teha/app/modules/categoria/categoria_nova/categoria_nova_page.dart';
import 'package:teha/app/modules/categoria/categoria_repository.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teha/app/modules/categoria/categoria_page.dart';
import 'package:teha/shared/custom_dio/custom_dio.dart';

class CategoriaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DataSearchController()),
        Bind((i) => CategoriaEditarController(
            i.get<CategoriaRepository>(), i.get<CategoriaController>())),
        Bind((i) => CategoriaNovaController(
            i.get<CategoriaRepository>(), i.get<CategoriaController>())),
        Bind((i) => CategoriaRepository(AppModule.to.get<CustomDio>())),
        Bind((i) => CategoriaController(i.get<CategoriaRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CategoriaPage()),
        Router('/new', child: (_, args) => CategoriaNovaPage()),
        Router('/edit/:id',
            child: (_, args) => CategoriaEditarPage(
                  id: args.params['id'],
                )),
      ];

  static Inject get to => Inject<CategoriaModule>.of();
}
