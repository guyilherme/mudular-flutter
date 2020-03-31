import 'package:mobx/mobx.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_repository.dart';

part 'categoria_nova_controller.g.dart';

class CategoriaNovaController = _CategoriaNovaControllerBase
    with _$CategoriaNovaController;

abstract class _CategoriaNovaControllerBase with Store {
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

  Future<dynamic> newCategoria(CategoriaModel categoria) async {
    var res = await repo.newCategoria(categoria.toJson());
    return res;
  }
}
