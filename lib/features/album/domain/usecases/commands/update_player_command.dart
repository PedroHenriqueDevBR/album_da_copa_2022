import '../../../data/models/country_model.dart';
import '../../../data/models/football_player.dart';
import '../../interfaces/football_player_dao.dart';

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
