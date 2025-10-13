// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ep_characters.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EpisodeCharactersMob on _EpisodeCharactersMob, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??= Computed<bool>(
    () => super.isLoading,
    name: '_EpisodeCharactersMob.isLoading',
  )).value;
  Computed<bool>? _$hasExceptionComputed;

  @override
  bool get hasException => (_$hasExceptionComputed ??= Computed<bool>(
    () => super.hasException,
    name: '_EpisodeCharactersMob.hasException',
  )).value;
  Computed<EpisodeCharactersModel?>? _$episodeCharactersModelComputed;

  @override
  EpisodeCharactersModel? get episodeCharactersModel =>
      (_$episodeCharactersModelComputed ??= Computed<EpisodeCharactersModel?>(
        () => super.episodeCharactersModel,
        name: '_EpisodeCharactersMob.episodeCharactersModel',
      )).value;

  late final _$_isLoadingAtom = Atom(
    name: '_EpisodeCharactersMob._isLoading',
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
    name: '_EpisodeCharactersMob._hasException',
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

  late final _$_episodeCharactersModelAtom = Atom(
    name: '_EpisodeCharactersMob._episodeCharactersModel',
    context: context,
  );

  @override
  EpisodeCharactersModel? get _episodeCharactersModel {
    _$_episodeCharactersModelAtom.reportRead();
    return super._episodeCharactersModel;
  }

  @override
  set _episodeCharactersModel(EpisodeCharactersModel? value) {
    _$_episodeCharactersModelAtom.reportWrite(
      value,
      super._episodeCharactersModel,
      () {
        super._episodeCharactersModel = value;
      },
    );
  }

  late final _$getEpCharactersAsyncAction = AsyncAction(
    '_EpisodeCharactersMob.getEpCharacters',
    context: context,
  );

  @override
  Future<void> getEpCharacters(BuildContext context, {required String id}) {
    return _$getEpCharactersAsyncAction.run(
      () => super.getEpCharacters(context, id: id),
    );
  }

  late final _$_EpisodeCharactersMobActionController = ActionController(
    name: '_EpisodeCharactersMob',
    context: context,
  );

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_EpisodeCharactersMobActionController.startAction(
      name: '_EpisodeCharactersMob.setLoading',
    );
    try {
      return super.setLoading(value);
    } finally {
      _$_EpisodeCharactersMobActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setException(bool value) {
    final _$actionInfo = _$_EpisodeCharactersMobActionController.startAction(
      name: '_EpisodeCharactersMob.setException',
    );
    try {
      return super.setException(value);
    } finally {
      _$_EpisodeCharactersMobActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasException: ${hasException},
episodeCharactersModel: ${episodeCharactersModel}
    ''';
  }
}
