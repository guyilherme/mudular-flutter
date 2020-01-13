// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriaController on _CategoriaBase, Store {
  final _$categoriasListaAtom = Atom(name: '_CategoriaBase.categoriasLista');

  @override
  CategoriaListaModel get categoriasLista {
    _$categoriasListaAtom.context.enforceReadPolicy(_$categoriasListaAtom);
    _$categoriasListaAtom.reportObserved();
    return super.categoriasLista;
  }

  @override
  set categoriasLista(CategoriaListaModel value) {
    _$categoriasListaAtom.context.conditionallyRunInAction(() {
      super.categoriasLista = value;
      _$categoriasListaAtom.reportChanged();
    }, _$categoriasListaAtom, name: '${_$categoriasListaAtom.name}_set');
  }

  final _$getCategoriasAsyncAction = AsyncAction('getCategorias');

  @override
  Future getCategorias() {
    return _$getCategoriasAsyncAction.run(() => super.getCategorias());
  }
}
