// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_country_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateCountryStore on _CreateCountryStoreBase, Store {
  late final _$selectedFlagIndexAtom =
      Atom(name: '_CreateCountryStoreBase.selectedFlagIndex', context: context);

  @override
  int get selectedFlagIndex {
    _$selectedFlagIndexAtom.reportRead();
    return super.selectedFlagIndex;
  }

  @override
  set selectedFlagIndex(int value) {
    _$selectedFlagIndexAtom.reportWrite(value, super.selectedFlagIndex, () {
      super.selectedFlagIndex = value;
    });
  }

  late final _$countryNameAtom =
      Atom(name: '_CreateCountryStoreBase.countryName', context: context);

  @override
  String get countryName {
    _$countryNameAtom.reportRead();
    return super.countryName;
  }

  @override
  set countryName(String value) {
    _$countryNameAtom.reportWrite(value, super.countryName, () {
      super.countryName = value;
    });
  }

  late final _$_CreateCountryStoreBaseActionController =
      ActionController(name: '_CreateCountryStoreBase', context: context);

  @override
  void loadFlags() {
    final _$actionInfo = _$_CreateCountryStoreBaseActionController.startAction(
        name: '_CreateCountryStoreBase.loadFlags');
    try {
      return super.loadFlags();
    } finally {
      _$_CreateCountryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountryName(String value) {
    final _$actionInfo = _$_CreateCountryStoreBaseActionController.startAction(
        name: '_CreateCountryStoreBase.setCountryName');
    try {
      return super.setCountryName(value);
    } finally {
      _$_CreateCountryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectFlag(int index) {
    final _$actionInfo = _$_CreateCountryStoreBaseActionController.startAction(
        name: '_CreateCountryStoreBase.selectFlag');
    try {
      return super.selectFlag(index);
    } finally {
      _$_CreateCountryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedFlagIndex: ${selectedFlagIndex},
countryName: ${countryName}
    ''';
  }
}
