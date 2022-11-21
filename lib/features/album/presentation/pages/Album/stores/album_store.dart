import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/errors/custom_exceptions.dart';
import '../../../../../../shared/styles/images.dart';
import '../../../../data/models/country_model.dart';
import '../../../../domain/usecases/queries/fetch_all_countries.dart';

part 'album_store.g.dart';

class AlbumStore extends _AlbumStoreBase with _$AlbumStore {
  AlbumStore({
    required FetchCountriesQuery fetchCountries,
  }) {
    super._fetchCountries = fetchCountries;
  }
}

abstract class _AlbumStoreBase with Store {
  final _allCountries = ObservableList<CountryModel>();
  late final FetchCountriesQuery _fetchCountries;

  final images = AppImages();
  final countries = ObservableList<CountryModel>();

  void loadCoutries() async {
    try {
      final response = await _fetchCountries.call();
      _allCountries.clear();
      countries.clear();
      _allCountries.addAll(response);
      countries.addAll(response);
    } on ServerException {
      asuka.showSnackBar(
        const SnackBar(content: Text('Erro ao carregar lista de países')),
      );
    }
  }

  void filterCoutries(String search) {
    countries.clear();
    if (search.isEmpty) {
      countries.addAll(_allCountries);
    }
    for (final country in _allCountries) {
      if (country.name.toLowerCase().contains(search.toLowerCase())) {
        countries.add(country);
      }
    }
  }
}
