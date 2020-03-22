import 'package:mobx/mobx.dart';

part 'categoria_nova_controller.g.dart';

class CategoriaNovaController = _CategoriaNovaControllerBase
    with _$CategoriaNovaController;

abstract class _CategoriaNovaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
