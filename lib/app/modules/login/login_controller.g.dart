// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid))
          .value;
  Computed<bool> _$isSenhaValidComputed;

  @override
  bool get isSenhaValid =>
      (_$isSenhaValidComputed ??= Computed<bool>(() => super.isSenhaValid))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid)).value;

  final _$jwtAtom = Atom(name: '_LoginBase.jwt');

  @override
  String get jwt {
    _$jwtAtom.context.enforceReadPolicy(_$jwtAtom);
    _$jwtAtom.reportObserved();
    return super.jwt;
  }

  @override
  set jwt(String value) {
    _$jwtAtom.context.conditionallyRunInAction(() {
      super.jwt = value;
      _$jwtAtom.reportChanged();
    }, _$jwtAtom, name: '${_$jwtAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_LoginBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_LoginBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$logadoAtom = Atom(name: '_LoginBase.logado');

  @override
  bool get logado {
    _$logadoAtom.context.enforceReadPolicy(_$logadoAtom);
    _$logadoAtom.reportObserved();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.context.conditionallyRunInAction(() {
      super.logado = value;
      _$logadoAtom.reportChanged();
    }, _$logadoAtom, name: '${_$logadoAtom.name}_set');
  }

  final _$usuarioLogadoAtom = Atom(name: '_LoginBase.usuarioLogado');

  @override
  UsuarioModel get usuarioLogado {
    _$usuarioLogadoAtom.context.enforceReadPolicy(_$usuarioLogadoAtom);
    _$usuarioLogadoAtom.reportObserved();
    return super.usuarioLogado;
  }

  @override
  set usuarioLogado(UsuarioModel value) {
    _$usuarioLogadoAtom.context.conditionallyRunInAction(() {
      super.usuarioLogado = value;
      _$usuarioLogadoAtom.reportChanged();
    }, _$usuarioLogadoAtom, name: '${_$usuarioLogadoAtom.name}_set');
  }

  final _$mostrarSenhaAtom = Atom(name: '_LoginBase.mostrarSenha');

  @override
  bool get mostrarSenha {
    _$mostrarSenhaAtom.context.enforceReadPolicy(_$mostrarSenhaAtom);
    _$mostrarSenhaAtom.reportObserved();
    return super.mostrarSenha;
  }

  @override
  set mostrarSenha(bool value) {
    _$mostrarSenhaAtom.context.conditionallyRunInAction(() {
      super.mostrarSenha = value;
      _$mostrarSenhaAtom.reportChanged();
    }, _$mostrarSenhaAtom, name: '${_$mostrarSenhaAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_LoginBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic changeLoading() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeLoading();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUsuario(UsuarioModel value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeUsuario(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMostrarSenha() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setMostrarSenha();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLogado(bool value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeLogado(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeSenha(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeJwt(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeJwt(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }
}
