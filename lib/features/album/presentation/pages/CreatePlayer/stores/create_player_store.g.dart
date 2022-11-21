// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatePlayerStore on _CreatePlayerStoreBase, Store {
  late final _$nameAtom =
      Atom(name: '_CreatePlayerStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$numberAtom =
      Atom(name: '_CreatePlayerStoreBase.number', context: context);

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$_CreatePlayerStoreBaseActionController =
      ActionController(name: '_CreatePlayerStoreBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreatePlayerStoreBaseActionController.startAction(
        name: '_CreatePlayerStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreatePlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$_CreatePlayerStoreBaseActionController.startAction(
        name: '_CreatePlayerStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_CreatePlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
number: ${number}
    ''';
  }
}
