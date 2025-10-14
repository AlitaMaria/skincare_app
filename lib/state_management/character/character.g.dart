// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterData on _character, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??= Computed<bool>(
    () => super.isLoading,
    name: '_character.isLoading',
  )).value;
  Computed<bool>? _$hasExceptionComputed;

  @override
  bool get hasException => (_$hasExceptionComputed ??= Computed<bool>(
    () => super.hasException,
    name: '_character.hasException',
  )).value;
  Computed<CharacterListModel?>? _$characterDetailModelComputed;

  @override
  CharacterListModel? get characterDetailModel =>
      (_$characterDetailModelComputed ??= Computed<CharacterListModel?>(
        () => super.characterDetailModel,
        name: '_character.characterDetailModel',
      )).value;

  late final _$_isLoadingAtom = Atom(
    name: '_character._isLoading',
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
    name: '_character._hasException',
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

  late final _$_characterDetailModelAtom = Atom(
    name: '_character._characterDetailModel',
    context: context,
  );

  @override
  CharacterListModel? get _characterDetailModel {
    _$_characterDetailModelAtom.reportRead();
    return super._characterDetailModel;
  }

  @override
  set _characterDetailModel(CharacterListModel? value) {
    _$_characterDetailModelAtom.reportWrite(
      value,
      super._characterDetailModel,
      () {
        super._characterDetailModel = value;
      },
    );
  }

  late final _$getCharacterByIdAsyncAction = AsyncAction(
    '_character.getCharacterById',
    context: context,
  );

  @override
  Future<void> getCharacterById(BuildContext context, {required String id}) {
    return _$getCharacterByIdAsyncAction.run(
      () => super.getCharacterById(context, id: id),
    );
  }

  late final _$_characterActionController = ActionController(
    name: '_character',
    context: context,
  );

  @override
  void putLoading(bool value) {
    final _$actionInfo = _$_characterActionController.startAction(
      name: '_character.putLoading',
    );
    try {
      return super.putLoading(value);
    } finally {
      _$_characterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void putException(bool value) {
    final _$actionInfo = _$_characterActionController.startAction(
      name: '_character.putException',
    );
    try {
      return super.putException(value);
    } finally {
      _$_characterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasException: ${hasException},
characterDetailModel: ${characterDetailModel}
    ''';
  }
}
