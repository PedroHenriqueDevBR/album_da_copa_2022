import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../shared/errors/custom_exceptions.dart';
import '../../../../data/models/football_player.dart';
import '../../../../domain/usecases/commands/delete_player_command.dart';

part 'player_details_store.g.dart';

class PlayerDetailsStore extends _PlayerDetailsStoreBase
    with _$PlayerDetailsStore {
  PlayerDetailsStore({
    required DeletePlayerCommand deletePlayerCommand,
    required FootballPlayerModel player,
  }) {
    super.deletePlayerCommand = deletePlayerCommand;
    super.player = player;
  }
}

abstract class _PlayerDetailsStoreBase with Store {
  late final DeletePlayerCommand deletePlayerCommand;
  late final FootballPlayerModel player;

  Future<void> deletePlayer() async {
    try {
      await deletePlayerCommand.call(player: player);
      showMessage('${player.name} deletado!');
    } on NotFoundException {
      showMessage('Jogador não encontrado no banco de dados');
    }
  }

  void showMessage(String text) {
    asuka.showSnackBar(SnackBar(content: Text(text)));
  }
}
