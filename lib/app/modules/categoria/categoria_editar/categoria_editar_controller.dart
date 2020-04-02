import 'package:mobx/mobx.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:teha/app/modules/categoria/categoria_repository.dart';

part 'categoria_editar_controller.g.dart';

class CategoriaEditarController = _CategoriaEditarControllerBase
    with _$CategoriaEditarController;

abstract class _CategoriaEditarControllerBase with Store {
  final CategoriaRepository repo;
  final CategoriaController categoriaController;
  _CategoriaEditarControllerBase(this.repo, this.categoriaController);

  @observable
  String nomeCategoria = "";

  @observable
  CategoriaModel categoria;

  @observable
  bool categoriaCadastrada = false;

  @observable
  bool loading = false;

  @action
  changeLoading() => loading = !loading;

  @action
  cancheCategoriaCadastrada(bool value) => categoriaCadastrada = value;

  @action
  changeNomeCategoria(String value) {
    nomeCategoria = value;
    categoria.nome = nomeCategoria;
  }

  @computed
  bool get isNomeCategoriaValid => nomeCategoria != '';

  Future<dynamic> changeCategoria(CategoriaModel categoria) async {
    changeLoading();
    var res =
        await repo.editCategoria(id: categoria.id, data: categoria.toJson());
    changeLoading();
    return res;
  }

  @action
  Future<void> getCategoria({int id}) async {
    try {
      final res = await repo.getCategoria(id: id);
      categoria = res;
      nomeCategoria = categoria.nome;
    } catch (e) {
      throw (e.response.statusCode);
    }
  }
}
