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

  final _$pageAtom = Atom(name: '_CategoriaBase.page');

  @override
  int get page {
    _$pageAtom.context.enforceReadPolicy(_$pageAtom);
    _$pageAtom.reportObserved();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.context.conditionallyRunInAction(() {
      super.page = value;
      _$pageAtom.reportChanged();
    }, _$pageAtom, name: '${_$pageAtom.name}_set');
  }

  final _$columnOrderAtom = Atom(name: '_CategoriaBase.columnOrder');

  @override
  String get columnOrder {
    _$columnOrderAtom.context.enforceReadPolicy(_$columnOrderAtom);
    _$columnOrderAtom.reportObserved();
    return super.columnOrder;
  }

  @override
  set columnOrder(String value) {
    _$columnOrderAtom.context.conditionallyRunInAction(() {
      super.columnOrder = value;
      _$columnOrderAtom.reportChanged();
    }, _$columnOrderAtom, name: '${_$columnOrderAtom.name}_set');
  }

  final _$orderAtom = Atom(name: '_CategoriaBase.order');

  @override
  String get order {
    _$orderAtom.context.enforceReadPolicy(_$orderAtom);
    _$orderAtom.reportObserved();
    return super.order;
  }

  @override
  set order(String value) {
    _$orderAtom.context.conditionallyRunInAction(() {
      super.order = value;
      _$orderAtom.reportChanged();
    }, _$orderAtom, name: '${_$orderAtom.name}_set');
  }

  final _$buttomIdAtom = Atom(name: '_CategoriaBase.buttomId');

  @override
  bool get buttomId {
    _$buttomIdAtom.context.enforceReadPolicy(_$buttomIdAtom);
    _$buttomIdAtom.reportObserved();
    return super.buttomId;
  }

  @override
  set buttomId(bool value) {
    _$buttomIdAtom.context.conditionallyRunInAction(() {
      super.buttomId = value;
      _$buttomIdAtom.reportChanged();
    }, _$buttomIdAtom, name: '${_$buttomIdAtom.name}_set');
  }

  final _$buttomAzAtom = Atom(name: '_CategoriaBase.buttomAz');

  @override
  bool get buttomAz {
    _$buttomAzAtom.context.enforceReadPolicy(_$buttomAzAtom);
    _$buttomAzAtom.reportObserved();
    return super.buttomAz;
  }

  @override
  set buttomAz(bool value) {
    _$buttomAzAtom.context.conditionallyRunInAction(() {
      super.buttomAz = value;
      _$buttomAzAtom.reportChanged();
    }, _$buttomAzAtom, name: '${_$buttomAzAtom.name}_set');
  }

  final _$getCategoriasAsyncAction = AsyncAction('getCategorias');

  @override
  Future getCategorias({int page, String columnOrder, String order}) {
    return _$getCategoriasAsyncAction.run(() => super
        .getCategorias(page: page, columnOrder: columnOrder, order: order));
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
  dynamic changeButtomId(bool value) {
    final _$actionInfo = _$_CategoriaBaseActionController.startAction();
    try {
      return super.changeButtomId(value);
    } finally {
      _$_CategoriaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeButtomAz(bool value) {
    final _$actionInfo = _$_CategoriaBaseActionController.startAction();
    try {
      return super.changeButtomAz(value);
    } finally {
      _$_CategoriaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePage() {
    final _$actionInfo = _$_CategoriaBaseActionController.startAction();
    try {
      return super.changePage();
    } finally {
      _$_CategoriaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeColumnOrder(String value) {
    final _$actionInfo = _$_CategoriaBaseActionController.startAction();
    try {
      return super.changeColumnOrder(value);
    } finally {
      _$_CategoriaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeOrder(String value) {
    final _$actionInfo = _$_CategoriaBaseActionController.startAction();
    try {
      return super.changeOrder(value);
    } finally {
      _$_CategoriaBaseActionController.endAction(_$actionInfo);
    }
  }

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
