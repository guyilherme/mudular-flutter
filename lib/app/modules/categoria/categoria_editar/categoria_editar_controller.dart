import 'package:mobx/mobx.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_repository.dart';
import 'package:validators/validators.dart';

part 'categoria_editar_controller.g.dart';

class CategoriaEditarController = _CategoriaEditarControllerBase
    with _$CategoriaEditarController;

abstract class _CategoriaEditarControllerBase with Store {
  final FormErrorState error = FormErrorState();
  final CategoriaRepository repo;
  _CategoriaEditarControllerBase(this.repo);

  @observable
  String nomeCategoria = "";

  @observable
  CategoriaModel categoria;

  @observable
  bool categoriaCadastrada = false;

  @action
  cancheCategoriaCadastrada(bool value) => categoriaCadastrada = value;

  @action
  changeNomeCategoria(String value) {
    nomeCategoria = value;
    categoria.nome = nomeCategoria;
  }

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [reaction((_) => nomeCategoria, validadeCategoria)];
  }

  @action
  void validadeCategoria(String value) {
    if (isNull(value) || value.isEmpty) {
      error.nomeCategoria = 'Nome da categoria não pode ser em branco';
      return;
    }
  }

  void validateAll() {
    validadeCategoria(nomeCategoria);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  Future<dynamic> changeCategoria(CategoriaModel categoria) async {
    var res = await repo.newCategorias(categoria.toJson());
    return res;
  }

  @action
  getCategoria({int id}) async {
    try {
      final res = await repo.getCategoria(id: id);
      categoria = res;
      nomeCategoria = categoria.nome;
    } catch (e) {
      throw (e.response.statusCode);
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String nomeCategoria;

  @computed
  bool get hasErrors => nomeCategoria != null;
}
