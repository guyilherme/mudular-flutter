import 'package:mobx/mobx.dart';
import 'package:teha/app/modules/login/login_repository.dart';
import 'package:teha/shared/custom_dio/constants.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  final LoginRepository repo;
  _LoginBase(this.repo);

  @observable
  String jwt = '';

  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  bool logado = false;

  @action
  changeLogado(bool value) => logado = value;

  @action
  changeEmail(String value) => email = value;

  @action
  changeSenha(String value) => senha = value;

  @action
  changeJwt(String value) => jwt = value;

  @computed
  bool get isEmailValid => email != '';

  @computed
  bool get isSenhaValid => senha != '';

  @computed
  bool get isFormValid => isEmailValid && isSenhaValid;

  Future<String> login(String email, String senha) async {
    var res = await repo.login({
      "username": email,
      "password": senha,
      "grant_type": "password",
      "client_id": IDENTIFIER,
      "client_secret": SECRET,
      "scope": ""
    });
    jwt = "Bearer ${res['access_token']}";
    logado = true;
    return jwt;
  }
}
