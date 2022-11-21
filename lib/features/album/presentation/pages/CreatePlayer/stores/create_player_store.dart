import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/errors/custom_exceptions.dart';
import '../../../../../../shared/styles/images.dart';
import '../../../../data/models/country_model.dart';
import '../../../../data/models/football_player.dart';
import '../../../../domain/usecases/commands/create_player_command.dart';
import '../../../../domain/usecases/commands/update_player_command.dart';

part 'create_player_store.g.dart';

class CreatePlayerStore extends _CreatePlayerStoreBase
    with _$CreatePlayerStore {
  CreatePlayerStore({
    required CreatePlayerCommand createPlayerCommand,
    required UpdatePlayerCommand updatePlayerCommand,
    required CountryModel country,
  }) {
    super.createPlayerCommand = createPlayerCommand;
    super.updatePlayerCommand = updatePlayerCommand;
    super.country = country;
  }
}

abstract class _CreatePlayerStoreBase with Store {
  late final CreatePlayerCommand createPlayerCommand;
  late final UpdatePlayerCommand updatePlayerCommand;
  late final CountryModel country;
  FootballPlayerModel? savedPlayer;
  AppImages images = AppImages();

  @observable
  String name = '';

  @observable
  String number = '';

  @action
  void setName(String value) => name = value;

  @action
  void setNumber(String value) => number = value;

  void registerPlayer() =>
      savedPlayer == null ? _createPlayer() : _updatePlayer();

  void _formIsValid() {
    if (name.isEmpty) {
      showMessage('Informe o nome do jogador');
      throw InvalidDataException();
    } else if (number.isEmpty) {
      showMessage('Informe o número da camisa');
      throw InvalidDataException();
    }
  }

  void _createPlayer() async {
    try {
      _formIsValid();
      final player = FootballPlayerModel(
        name: name,
        number: number,
        photo: images.player,
      );
      final response = await createPlayerCommand.call(
        player: player,
        country: country,
      );
      player.id = response;
      savedPlayer = player;
      showMessage('Dados registrados');
    } on InvalidDataException {
      showMessage('Verifique os dados e tente novamente');
    } on ServerException {
      showMessage('Sem conexão com o banco de dados');
    } on RegisteredDataException {
      showMessage('Jogador já cadastrado!');
    }
  }

  void _updatePlayer() async {
    try {
      _formIsValid();
      savedPlayer!.name = name;
      savedPlayer!.number = number;
      await updatePlayerCommand.call(
        player: savedPlayer!,
        country: country,
      );
      showMessage('Dados registrados');
    } on InvalidDataException {
      showMessage('Verifique os dados e tente novamente');
    } on NotFoundException {
      showMessage('Jogador não localizado no banco de dados');
    } on ServerException {
      showMessage('Sem conexão com o banco de dados');
    }
  }

  void showMessage(String text) {
    asuka.showSnackBar(SnackBar(content: Text(text)));
  }
}
