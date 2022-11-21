import '../../../data/models/country_model.dart';
import '../../../data/models/football_player.dart';
import '../../interfaces/football_player_dao.dart';

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
