import 'package:mobx/mobx.dart';

part 'sidemenu_controller.g.dart';

class SidemenuController = _SidemenuBase with _$SidemenuController;

abstract class _SidemenuBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
