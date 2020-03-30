import 'package:mobx/mobx.dart';

part 'data_search_controller.g.dart';

class DataSearchController = _DataSearchControllerBase
    with _$DataSearchController;

abstract class _DataSearchControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
