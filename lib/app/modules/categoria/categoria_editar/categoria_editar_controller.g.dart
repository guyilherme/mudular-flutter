// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_editar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriaEditarController on _CategoriaEditarControllerBase, Store {
  final _$nomeCategoriaAtom =
      Atom(name: '_CategoriaEditarControllerBase.nomeCategoria');

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

  final _$categoriaAtom =
      Atom(name: '_CategoriaEditarControllerBase.categoria');

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
      Atom(name: '_CategoriaEditarControllerBase.categoriaCadastrada');

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

  final _$getCategoriaAsyncAction = AsyncAction('getCategoria');

  @override
  Future getCategoria({int id}) {
    return _$getCategoriaAsyncAction.run(() => super.getCategoria(id: id));
  }

  final _$_CategoriaEditarControllerBaseActionController =
      ActionController(name: '_CategoriaEditarControllerBase');

  @override
  dynamic cancheCategoriaCadastrada(bool value) {
    final _$actionInfo =
        _$_CategoriaEditarControllerBaseActionController.startAction();
    try {
      return super.cancheCategoriaCadastrada(value);
    } finally {
      _$_CategoriaEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNomeCategoria(String value) {
    final _$actionInfo =
        _$_CategoriaEditarControllerBaseActionController.startAction();
    try {
      return super.changeNomeCategoria(value);
    } finally {
      _$_CategoriaEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validadeCategoria(String value) {
    final _$actionInfo =
        _$_CategoriaEditarControllerBaseActionController.startAction();
    try {
      return super.validadeCategoria(value);
    } finally {
      _$_CategoriaEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors)).value;

  final _$nomeCategoriaAtom = Atom(name: '_FormErrorState.nomeCategoria');

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
}
