import 'package:album_da_copa_2022/features/album/data/models/football_player.dart';
import 'package:album_da_copa_2022/features/album/domain/interfaces/football_player_dao.dart';

import '../../../data/models/country_model.dart';

class CreatePlayerCommand {
  final FootballPlayerDao playerDao;

  CreatePlayerCommand({required this.playerDao});

  Future<int> call({
    required FootballPlayerModel player,
    required CountryModel country,
  }) =>
      playerDao.createFootballPlayer(
        player: player,
        country: country,
      );
}
