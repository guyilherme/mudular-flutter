// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
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

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

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
