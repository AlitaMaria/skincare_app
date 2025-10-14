// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characterlist.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterListing on _characterListing, Store {
  Computed<bool>? _$isTappedComputed;

  @override
  bool get isTapped => (_$isTappedComputed ??= Computed<bool>(
    () => super.isTapped,
    name: '_characterListing.isTapped',
  )).value;
  Computed<int>? _$currentPageComputed;

  @override
  int get currentPage => (_$currentPageComputed ??= Computed<int>(
    () => super.currentPage,
    name: '_characterListing.currentPage',
  )).value;
  Computed<bool>? _$hasExceptionComputed;

  @override
  bool get hasException => (_$hasExceptionComputed ??= Computed<bool>(
    () => super.hasException,
    name: '_characterListing.hasException',
  )).value;
  Computed<ObservableList<String>>? _$favoritesComputed;

  @override
  ObservableList<String> get favorites =>
      (_$favoritesComputed ??= Computed<ObservableList<String>>(
        () => super.favorites,
        name: '_characterListing.favorites',
      )).value;
  Computed<ObservableList<Result>>? _$wishlistItemsComputed;

  @override
  ObservableList<Result> get wishlistItems =>
      (_$wishlistItemsComputed ??= Computed<ObservableList<Result>>(
        () => super.wishlistItems,
        name: '_characterListing.wishlistItems',
      )).value;
  Computed<CharacterListModel?>? _$characterListModelComputed;

  @override
  CharacterListModel? get characterListModel =>
      (_$characterListModelComputed ??= Computed<CharacterListModel?>(
        () => super.characterListModel,
        name: '_characterListing.characterListModel',
      )).value;

  late final _$_isTappedAtom = Atom(
    name: '_characterListing._isTapped',
    context: context,
  );

  @override
  bool get _isTapped {
    _$_isTappedAtom.reportRead();
    return super._isTapped;
  }

  @override
  set _isTapped(bool value) {
    _$_isTappedAtom.reportWrite(value, super._isTapped, () {
      super._isTapped = value;
    });
  }

  late final _$_currentPageAtom = Atom(
    name: '_characterListing._currentPage',
    context: context,
  );

  @override
  int get _currentPage {
    _$_currentPageAtom.reportRead();
    return super._currentPage;
  }

  @override
  set _currentPage(int value) {
    _$_currentPageAtom.reportWrite(value, super._currentPage, () {
      super._currentPage = value;
    });
  }

  late final _$_hasExceptionAtom = Atom(
    name: '_characterListing._hasException',
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

  late final _$_favoritesAtom = Atom(
    name: '_characterListing._favorites',
    context: context,
  );

  @override
  ObservableList<String> get _favorites {
    _$_favoritesAtom.reportRead();
    return super._favorites;
  }

  @override
  set _favorites(ObservableList<String> value) {
    _$_favoritesAtom.reportWrite(value, super._favorites, () {
      super._favorites = value;
    });
  }

  late final _$_wishlistItemsAtom = Atom(
    name: '_characterListing._wishlistItems',
    context: context,
  );

  @override
  ObservableList<Result> get _wishlistItems {
    _$_wishlistItemsAtom.reportRead();
    return super._wishlistItems;
  }

  @override
  set _wishlistItems(ObservableList<Result> value) {
    _$_wishlistItemsAtom.reportWrite(value, super._wishlistItems, () {
      super._wishlistItems = value;
    });
  }

  late final _$refreshCounterAtom = Atom(
    name: '_characterListing.refreshCounter',
    context: context,
  );

  @override
  int get refreshCounter {
    _$refreshCounterAtom.reportRead();
    return super.refreshCounter;
  }

  @override
  set refreshCounter(int value) {
    _$refreshCounterAtom.reportWrite(value, super.refreshCounter, () {
      super.refreshCounter = value;
    });
  }

  late final _$_characterListModelAtom = Atom(
    name: '_characterListing._characterListModel',
    context: context,
  );

  @override
  CharacterListModel? get _characterListModel {
    _$_characterListModelAtom.reportRead();
    return super._characterListModel;
  }

  @override
  set _characterListModel(CharacterListModel? value) {
    _$_characterListModelAtom.reportWrite(value, super._characterListModel, () {
      super._characterListModel = value;
    });
  }

  late final _$cardAsyncAction = AsyncAction(
    '_characterListing.card',
    context: context,
  );

  @override
  Future<void> card(BuildContext context, {int currentPage = 1}) {
    return _$cardAsyncAction.run(
      () => super.card(context, currentPage: currentPage),
    );
  }

  late final _$_characterListingActionController = ActionController(
    name: '_characterListing',
    context: context,
  );

  @override
  void putException(bool value) {
    final _$actionInfo = _$_characterListingActionController.startAction(
      name: '_characterListing.putException',
    );
    try {
      return super.putException(value);
    } finally {
      _$_characterListingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tappingId(bool value) {
    final _$actionInfo = _$_characterListingActionController.startAction(
      name: '_characterListing.tappingId',
    );
    try {
      return super.tappingId(value);
    } finally {
      _$_characterListingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(int value) {
    final _$actionInfo = _$_characterListingActionController.startAction(
      name: '_characterListing.setPage',
    );
    try {
      return super.setPage(value);
    } finally {
      _$_characterListingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavorite(String id, Result item) {
    final _$actionInfo = _$_characterListingActionController.startAction(
      name: '_characterListing.toggleFavorite',
    );
    try {
      return super.toggleFavorite(id, item);
    } finally {
      _$_characterListingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refreshPage() {
    final _$actionInfo = _$_characterListingActionController.startAction(
      name: '_characterListing.refreshPage',
    );
    try {
      return super.refreshPage();
    } finally {
      _$_characterListingActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
refreshCounter: ${refreshCounter},
isTapped: ${isTapped},
currentPage: ${currentPage},
hasException: ${hasException},
favorites: ${favorites},
wishlistItems: ${wishlistItems},
characterListModel: ${characterListModel}
    ''';
  }
}
