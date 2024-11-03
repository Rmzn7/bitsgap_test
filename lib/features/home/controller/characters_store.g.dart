// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on _CharactersStore, Store {
  late final _$charactersListFutureAtom =
      Atom(name: '_CharactersStore.charactersListFuture', context: context);

  @override
  ObservableFuture<List<CharacterGeneral>> get charactersListFuture {
    _$charactersListFutureAtom.reportRead();
    return super.charactersListFuture;
  }

  bool _charactersListFutureIsInitialized = false;

  @override
  set charactersListFuture(ObservableFuture<List<CharacterGeneral>> value) {
    _$charactersListFutureAtom.reportWrite(value,
        _charactersListFutureIsInitialized ? super.charactersListFuture : null,
        () {
      super.charactersListFuture = value;
      _charactersListFutureIsInitialized = true;
    });
  }

  late final _$characterDetailsFutureAtom =
      Atom(name: '_CharactersStore.characterDetailsFuture', context: context);

  @override
  ObservableFuture<CharacterDetails> get characterDetailsFuture {
    _$characterDetailsFutureAtom.reportRead();
    return super.characterDetailsFuture;
  }

  bool _characterDetailsFutureIsInitialized = false;

  @override
  set characterDetailsFuture(ObservableFuture<CharacterDetails> value) {
    _$characterDetailsFutureAtom.reportWrite(
        value,
        _characterDetailsFutureIsInitialized
            ? super.characterDetailsFuture
            : null, () {
      super.characterDetailsFuture = value;
      _characterDetailsFutureIsInitialized = true;
    });
  }

  late final _$_CharactersStoreActionController =
      ActionController(name: '_CharactersStore', context: context);

  @override
  Future<dynamic> fetchCharacters() {
    final _$actionInfo = _$_CharactersStoreActionController.startAction(
        name: '_CharactersStore.fetchCharacters');
    try {
      return super.fetchCharacters();
    } finally {
      _$_CharactersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchCharacterDetails(String id) {
    final _$actionInfo = _$_CharactersStoreActionController.startAction(
        name: '_CharactersStore.fetchCharacterDetails');
    try {
      return super.fetchCharacterDetails(id);
    } finally {
      _$_CharactersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
charactersListFuture: ${charactersListFuture},
characterDetailsFuture: ${characterDetailsFuture}
    ''';
  }
}
