import 'package:album_da_copa_2022/features/album/data/models/country_model.dart';
import 'package:album_da_copa_2022/features/album/data/models/football_player.dart';

abstract class FootballPlayerDao {
  Future<List<FootballPlayerModel>> getAllFootbalPlayers();

  Future<List<FootballPlayerModel>> getFootbalPlayersByCountry({
    required CountryModel country,
  });

  Future<int> createFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  });

  Future<void> updateFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  });

  Future<void> deleteFootballPlayer({required FootballPlayerModel player});
}
