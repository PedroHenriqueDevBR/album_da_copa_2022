import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/errors/custom_exceptions.dart';
import '../../../../../../shared/styles/images.dart';
import '../../../../data/models/country_model.dart';
import '../../../../data/models/football_player.dart';
import '../../../../domain/usecases/commands/delete_country_command.dart';
import '../../../../domain/usecases/queries/fetch_players_by_country.dart';

part 'country_details_store.g.dart';

class CountryDetailsStore extends _CountryDetailsStoreBase
    with _$CountryDetailsStore {
  CountryDetailsStore({
    required FetchPlayersByCountryQuery fetchPlayersByCountry,
    required DeleteCountryCommand deleteCountryCommand,
    required CountryModel country,
  }) {
    super.fetchPlayersByCountry = fetchPlayersByCountry;
    super.deleteCountryCommand = deleteCountryCommand;
    super.country = country;
  }
}

abstract class _CountryDetailsStoreBase with Store {
  final AppImages images = AppImages();

  late final CountryModel country;
  late final FetchPlayersByCountryQuery fetchPlayersByCountry;
  late final DeleteCountryCommand deleteCountryCommand;

  final players = ObservableList<FootballPlayerModel>();

  Future<void> deleteCountry() async {
    try {
      await deleteCountryCommand.call(country: country);
      showMessage('${country.name} deletado!');
    } on NotFoundException {
      showMessage('Jogador não encontrado no banco de dados');
    }
  }

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
