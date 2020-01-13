import 'package:mobx/mobx.dart';
import 'package:teha/app/models/categoria/categoriaLista_model.dart';
import 'package:teha/app/modules/categoria/categoria_repository.dart';

part 'categoria_controller.g.dart';

class CategoriaController = _CategoriaBase with _$CategoriaController;

abstract class _CategoriaBase with Store {
  final CategoriaRepository repo;
  _CategoriaBase(this.repo);

  @observable
  CategoriaListaModel categoriasLista;

  @action
  getCategorias() async {
    var res = await repo.getCategorias();
    categoriasLista = res;
  }
}
