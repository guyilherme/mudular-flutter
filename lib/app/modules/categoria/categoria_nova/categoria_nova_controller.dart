import 'package:mobx/mobx.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_repository.dart';
import 'package:validators/validators.dart';

part 'categoria_nova_controller.g.dart';

class CategoriaNovaController = _CategoriaNovaControllerBase
    with _$CategoriaNovaController;

abstract class _CategoriaNovaControllerBase with Store {
  final FormErrorState error = FormErrorState();
  final CategoriaRepository repo;
  _CategoriaNovaControllerBase(this.repo);

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
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome'] = value;
    categoria = new CategoriaModel.fromJson(data);
    print("teste");
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

  Future<dynamic> newCategoria(CategoriaModel categoria) async {
    var res = await repo.newCategorias(categoria.toJson());
    return res;
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String nomeCategoria;

  @computed
  bool get hasErrors => nomeCategoria != null;
}
