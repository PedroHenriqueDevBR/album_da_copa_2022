import '../../../data/models/football_player.dart';
import '../../interfaces/football_player_dao.dart';

class DeletePlayerCommand {
  final FootballPlayerDao playerDao;

  DeletePlayerCommand({required this.playerDao});

  Future<void> call({required FootballPlayerModel player}) =>
      playerDao.deleteFootballPlayer(player: player);
}
