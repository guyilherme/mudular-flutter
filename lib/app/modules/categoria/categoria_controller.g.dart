// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriaController on _CategoriaBase, Store {
  final _$categoriasListaAtom = Atom(name: '_CategoriaBase.categoriasLista');

  @override
  List<CategoriaModel> get categoriasLista {
    _$categoriasListaAtom.context.enforceReadPolicy(_$categoriasListaAtom);
    _$categoriasListaAtom.reportObserved();
    return super.categoriasLista;
  }

  @override
  set categoriasLista(List<CategoriaModel> value) {
    _$categoriasListaAtom.context.conditionallyRunInAction(() {
      super.categoriasLista = value;
      _$categoriasListaAtom.reportChanged();
    }, _$categoriasListaAtom, name: '${_$categoriasListaAtom.name}_set');
  }

  final _$categoriaAtom = Atom(name: '_CategoriaBase.categoria');

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

  final _$statusAtom = Atom(name: '_CategoriaBase.status');

  @override
  dynamic get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(dynamic value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$lastPageAtom = Atom(name: '_CategoriaBase.lastPage');

  @override
  int get lastPage {
    _$lastPageAtom.context.enforceReadPolicy(_$lastPageAtom);
    _$lastPageAtom.reportObserved();
    return super.lastPage;
  }

  @override
  set lastPage(int value) {
    _$lastPageAtom.context.conditionallyRunInAction(() {
      super.lastPage = value;
      _$lastPageAtom.reportChanged();
    }, _$lastPageAtom, name: '${_$lastPageAtom.name}_set');
  }

  final _$getCategoriasAsyncAction = AsyncAction('getCategorias');

  @override
  Future getCategorias({int page}) {
    return _$getCategoriasAsyncAction
        .run(() => super.getCategorias(page: page));
  }

  final _$deleteCategoriaAsyncAction = AsyncAction('deleteCategoria');

  @override
  Future<dynamic> deleteCategoria({int id}) {
    return _$deleteCategoriaAsyncAction
        .run(() => super.deleteCategoria(id: id));
  }

  final _$_CategoriaBaseActionController =
      ActionController(name: '_CategoriaBase');

  @override
  dynamic changeLastPage(int value) {
    final _$actionInfo = _$_CategoriaBaseActionController.startAction();
    try {
      return super.changeLastPage(value);
    } finally {
      _$_CategoriaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCategoriasLista(List<CategoriaModel> value) {
    final _$actionInfo = _$_CategoriaBaseActionController.startAction();
    try {
      return super.changeCategoriasLista(value);
    } finally {
      _$_CategoriaBaseActionController.endAction(_$actionInfo);
    }
  }
}
