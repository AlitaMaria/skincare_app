// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_content.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchContent on _SearchContent, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??= Computed<bool>(
    () => super.isLoading,
    name: '_SearchContent.isLoading',
  )).value;
  Computed<bool>? _$hasExceptionComputed;

  @override
  bool get hasException => (_$hasExceptionComputed ??= Computed<bool>(
    () => super.hasException,
    name: '_SearchContent.hasException',
  )).value;
  Computed<Getsearchmodel?>? _$searchModelComputed;

  @override
  Getsearchmodel? get searchModel =>
      (_$searchModelComputed ??= Computed<Getsearchmodel?>(
        () => super.searchModel,
        name: '_SearchContent.searchModel',
      )).value;

  late final _$_isLoadingAtom = Atom(
    name: '_SearchContent._isLoading',
    context: context,
  );

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_hasExceptionAtom = Atom(
    name: '_SearchContent._hasException',
    context: context,
  );

  @override
  bool get _hasException {
    _$_hasExceptionAtom.reportRead();
    return super._hasException;
  }

  @override
  set _hasException(bool value) {
    _$_hasExceptionAtom.reportWrite(value, super._hasException, () {
      super._hasException = value;
    });
  }

  late final _$_searchModelAtom = Atom(
    name: '_SearchContent._searchModel',
    context: context,
  );

  @override
  Getsearchmodel? get _searchModel {
    _$_searchModelAtom.reportRead();
    return super._searchModel;
  }

  @override
  set _searchModel(Getsearchmodel? value) {
    _$_searchModelAtom.reportWrite(value, super._searchModel, () {
      super._searchModel = value;
    });
  }

  late final _$getSearchCharactersAsyncAction = AsyncAction(
    '_SearchContent.getSearchCharacters',
    context: context,
  );

  @override
  Future<void> getSearchCharacters(
    BuildContext context, {
    required String Search,
  }) {
    return _$getSearchCharactersAsyncAction.run(
      () => super.getSearchCharacters(context, Search: Search),
    );
  }

  late final _$_SearchContentActionController = ActionController(
    name: '_SearchContent',
    context: context,
  );

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SearchContentActionController.startAction(
      name: '_SearchContent.setLoading',
    );
    try {
      return super.setLoading(value);
    } finally {
      _$_SearchContentActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setException(bool value) {
    final _$actionInfo = _$_SearchContentActionController.startAction(
      name: '_SearchContent.setException',
    );
    try {
      return super.setException(value);
    } finally {
      _$_SearchContentActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearchModel() {
    final _$actionInfo = _$_SearchContentActionController.startAction(
      name: '_SearchContent.clearSearchModel',
    );
    try {
      return super.clearSearchModel();
    } finally {
      _$_SearchContentActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasException: ${hasException},
searchModel: ${searchModel}
    ''';
  }
}
