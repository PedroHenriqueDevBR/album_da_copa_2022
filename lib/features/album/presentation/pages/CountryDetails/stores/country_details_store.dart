import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/errors/custom_exceptions.dart';
import '../../../../data/models/country_model.dart';
import '../../../../data/models/football_player.dart';
import '../../../../domain/usecases/queries/fetch_players_by_country.dart';

part 'country_details_store.g.dart';

class CountryDetailsStore extends _CountryDetailsStoreBase
    with _$CountryDetailsStore {
  CountryDetailsStore({
    required FetchPlayersByCountryQuery fetchPlayersByCountry,
    required CountryModel country,
  }) {
    super.fetchPlayersByCountry = fetchPlayersByCountry;
    super.country = country;
  }
}

abstract class _CountryDetailsStoreBase with Store {
  late final FetchPlayersByCountryQuery fetchPlayersByCountry;
  late final CountryModel country;
  final players = ObservableList<FootballPlayerModel>();

  void loadPlayers() async {
    try {
      final response = await fetchPlayersByCountry(country);
      players.clear();
      players.addAll(response);
    } on ServerException {
      showMessage('Sem conexão com o banco de dados');
    }
  }

  void showMessage(String text) {
    asuka.showSnackBar(SnackBar(content: Text(text)));
  }
}
