import 'package:mobx/mobx.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_controller.dart';
import 'package:teha/app/modules/categoria/categoria_repository.dart';

part 'categoria_nova_controller.g.dart';

class CategoriaNovaController = _CategoriaNovaControllerBase
    with _$CategoriaNovaController;

abstract class _CategoriaNovaControllerBase with Store {
  final CategoriaRepository repo;
  final CategoriaController categoriaController;
  _CategoriaNovaControllerBase(this.repo, this.categoriaController);

  @observable
  String nomeCategoria = "";

  @observable
  CategoriaModel categoria;

  @observable
  bool categoriaCadastrada = false;

  @action
  cancheCategoriaCadastrada(bool value) => categoriaCadastrada = value;

  @action
  setNome(String value) => nomeCategoria = value;

  @action
  changeNomeCategoria() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = nomeCategoria;
    print(nomeCategoria);
    categoria = new CategoriaModel.fromJson(data);
  }

  @computed
  bool get isnomeCategoriaValid => nomeCategoria != '';

  @action
  Future<dynamic> newCategoria(CategoriaModel categoria) async {
    try {
      final res = await repo.newCategoria(categoria.toJson());
      categoria = res;
      nomeCategoria = categoria.nome;
      return res;
    } catch (e) {
      throw (e.response.statusCode);
    }
  }
}
