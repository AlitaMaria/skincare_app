// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailcharacter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailCharacter on _DetailCharacter, Store {
  Computed<bool>? _$istappedComputed;

  @override
  bool get istapped => (_$istappedComputed ??= Computed<bool>(
    () => super.istapped,
    name: '_DetailCharacter.istapped',
  )).value;
  Computed<bool>? _$hasExceptionComputed;

  @override
  bool get hasException => (_$hasExceptionComputed ??= Computed<bool>(
    () => super.hasException,
    name: '_DetailCharacter.hasException',
  )).value;
  Computed<CharacterListModel?>? _$characterListModelComputed;

  @override
  CharacterListModel? get characterListModel =>
      (_$characterListModelComputed ??= Computed<CharacterListModel?>(
        () => super.characterListModel,
        name: '_DetailCharacter.characterListModel',
      )).value;

  late final _$_istappedAtom = Atom(
    name: '_DetailCharacter._istapped',
    context: context,
  );

  @override
  bool get _istapped {
    _$_istappedAtom.reportRead();
    return super._istapped;
  }

  @override
  set _istapped(bool value) {
    _$_istappedAtom.reportWrite(value, super._istapped, () {
      super._istapped = value;
    });
  }

  late final _$_hasExceptionAtom = Atom(
    name: '_DetailCharacter._hasException',
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

  late final _$_characterListModelAtom = Atom(
    name: '_DetailCharacter._characterListModel',
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
    '_DetailCharacter.card',
    context: context,
  );

  @override
  Future<void> card(BuildContext context) {
    return _$cardAsyncAction.run(() => super.card(context));
  }

  late final _$_DetailCharacterActionController = ActionController(
    name: '_DetailCharacter',
    context: context,
  );

  @override
  void putException(bool value) {
    final _$actionInfo = _$_DetailCharacterActionController.startAction(
      name: '_DetailCharacter.putException',
    );
    try {
      return super.putException(value);
    } finally {
      _$_DetailCharacterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tapingId(bool value) {
    final _$actionInfo = _$_DetailCharacterActionController.startAction(
      name: '_DetailCharacter.tapingId',
    );
    try {
      return super.tapingId(value);
    } finally {
      _$_DetailCharacterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
istapped: ${istapped},
hasException: ${hasException},
characterListModel: ${characterListModel}
    ''';
  }
}
