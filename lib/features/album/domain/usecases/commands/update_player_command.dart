import 'package:album_da_copa_2022/features/album/data/models/football_player.dart';
import 'package:album_da_copa_2022/features/album/domain/interfaces/football_player_dao.dart';

import '../../../data/models/country_model.dart';

class UpdatePlayerCommand {
  final FootballPlayerDao playerDao;

  UpdatePlayerCommand({required this.playerDao});

  Future<void> call({
    required FootballPlayerModel player,
    required CountryModel country,
  }) =>
      playerDao.updateFootballPlayer(
        player: player,
        country: country,
      );
}
