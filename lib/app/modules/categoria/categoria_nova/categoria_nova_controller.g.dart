// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_nova_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriaNovaController on _CategoriaNovaControllerBase, Store {
  Computed<bool> _$isnomeCategoriaValidComputed;

  @override
  bool get isnomeCategoriaValid => (_$isnomeCategoriaValidComputed ??=
          Computed<bool>(() => super.isnomeCategoriaValid))
      .value;

  final _$nomeCategoriaAtom =
      Atom(name: '_CategoriaNovaControllerBase.nomeCategoria');

  @override
  String get nomeCategoria {
    _$nomeCategoriaAtom.context.enforceReadPolicy(_$nomeCategoriaAtom);
    _$nomeCategoriaAtom.reportObserved();
    return super.nomeCategoria;
  }

  @override
  set nomeCategoria(String value) {
    _$nomeCategoriaAtom.context.conditionallyRunInAction(() {
      super.nomeCategoria = value;
      _$nomeCategoriaAtom.reportChanged();
    }, _$nomeCategoriaAtom, name: '${_$nomeCategoriaAtom.name}_set');
  }

  final _$categoriaAtom = Atom(name: '_CategoriaNovaControllerBase.categoria');

  @override
  CategoriaModel get categoria {
    _$categoriaAtom.context.enforceReadPolicy(_$categoriaAtom);
    _$categoriaAtom.reportObserved();
    return super.categoria;
  }

  @override
  set categoria(CategoriaModel value) {
    _$categoriaAtom.context.conditionallyRunInAction(() {
      super.categoria = value;
      _$categoriaAtom.reportChanged();
    }, _$categoriaAtom, name: '${_$categoriaAtom.name}_set');
  }

  final _$categoriaCadastradaAtom =
      Atom(name: '_CategoriaNovaControllerBase.categoriaCadastrada');

  @override
  bool get categoriaCadastrada {
    _$categoriaCadastradaAtom.context
        .enforceReadPolicy(_$categoriaCadastradaAtom);
    _$categoriaCadastradaAtom.reportObserved();
    return super.categoriaCadastrada;
  }

  @override
  set categoriaCadastrada(bool value) {
    _$categoriaCadastradaAtom.context.conditionallyRunInAction(() {
      super.categoriaCadastrada = value;
      _$categoriaCadastradaAtom.reportChanged();
    }, _$categoriaCadastradaAtom,
        name: '${_$categoriaCadastradaAtom.name}_set');
  }

  final _$_CategoriaNovaControllerBaseActionController =
      ActionController(name: '_CategoriaNovaControllerBase');

  @override
  dynamic cancheCategoriaCadastrada(bool value) {
    final _$actionInfo =
        _$_CategoriaNovaControllerBaseActionController.startAction();
    try {
      return super.cancheCategoriaCadastrada(value);
    } finally {
      _$_CategoriaNovaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(String value) {
    final _$actionInfo =
        _$_CategoriaNovaControllerBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_CategoriaNovaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNomeCategoria() {
    final _$actionInfo =
        _$_CategoriaNovaControllerBaseActionController.startAction();
    try {
      return super.changeNomeCategoria();
    } finally {
      _$_CategoriaNovaControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
