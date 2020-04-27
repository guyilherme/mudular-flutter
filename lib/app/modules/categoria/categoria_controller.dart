import 'package:mobx/mobx.dart';
import 'package:teha/app/models/categoria/categoria_model.dart';
import 'package:teha/app/modules/categoria/categoria_repository.dart';

part 'categoria_controller.g.dart';

class CategoriaController = _CategoriaBase with _$CategoriaController;

abstract class _CategoriaBase with Store {
  final CategoriaRepository repo;
  _CategoriaBase(this.repo);

  @observable
  List<CategoriaModel> categoriasLista;

  @observable
  CategoriaModel categoria;

  @observable
  dynamic status;

  @observable
  int lastPage = 1;

  @observable
  int page = 1;

  @observable
  String columnOrder = "id";

  @observable
  String order = "asc";

  @observable
  bool buttomId = true;

  @observable
  bool buttomAz = false;

  @action
  changeButtomId(bool value) {
    buttomId = value;
    buttomAz = !value;
    columnOrder = "id";
  }

  @action
  changeButtomAz(bool value) {
    buttomAz = value;
    buttomId = !value;
    columnOrder = "nome";
  }

  @action
  changePage() {
    page++;
  }

  @action
  changeColumnOrder(String value) => columnOrder = value;

  @action
  changeOrder(String value) => order = value;

  @action
  changeLastPage(int value) => lastPage = value;

  @action
  changeCategoriasLista(List<CategoriaModel> value) => categoriasLista = value;

  @action
  getCategorias({int page, String columnOrder, String order}) async {
    List<CategoriaModel> lista;
    try {
      final res = await repo.getCategorias(
          page: page, columnOrder: columnOrder, order: order);
      if (categoriasLista == null) {
        categoriasLista = res;
      } else {
        lista = categoriasLista;
        res.forEach((element) {
          lista.add(element);
        });
        categoriasLista = lista;
      }
    } catch (e) {
      status = e;
    }
  }

  @action
  Future<dynamic> deleteCategoria({int id}) async {
    try {
      final res = await repo.deleteCategoria(id: id);
      categoria = res;
      return categoria;
    } catch (e) {
      throw (e.response.statusCode);
    }
  }
}
