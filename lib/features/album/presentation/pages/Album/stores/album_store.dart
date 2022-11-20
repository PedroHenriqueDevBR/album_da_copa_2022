import 'package:album_da_copa_2022/features/album/data/models/country_model.dart';
import 'package:album_da_copa_2022/features/album/domain/usecases/queries/fetch_all_countries.dart';
import 'package:album_da_copa_2022/shared/errors/custom_exceptions.dart';
import 'package:album_da_copa_2022/shared/styles/images.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'album_store.g.dart';

class AlbumStore extends _AlbumStoreBase with _$AlbumStore {
  AlbumStore({
    required FetchCountriesQuery fetchCountries,
  }) {
    super.fetchCountries = fetchCountries;
  }
}

abstract class _AlbumStoreBase with Store {
  final images = AppImages();

  late final FetchCountriesQuery fetchCountries;

  ObservableList<CountryModel> allCountries = ObservableList<CountryModel>();
  ObservableList<CountryModel> countries = ObservableList<CountryModel>();

  void loadCoutries() async {
    try {
      final response = await fetchCountries.call();
      allCountries.clear();
      countries.clear();
      allCountries.addAll(response);
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
      countries.addAll(allCountries);
    }
    for (final country in allCountries) {
      if (country.name.toLowerCase().contains(search.toLowerCase())) {
        countries.add(country);
      }
    }
  }
}
