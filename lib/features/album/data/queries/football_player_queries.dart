import '../models/country_model.dart';
import '../models/football_player.dart';

abstract class FootballPlayerSqlQueries {
  String createFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  });

  String getAllFootballPlayers();

  String getAllFootballPlayersFromCountry(CountryModel country);

  String deleteFootballPlayer(FootballPlayerModel player);

  String updateFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  });
}

class FootballPlayerSqlQueriesImplementation
    implements FootballPlayerSqlQueries {
  @override
  String createFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  }) =>
      '''
      INSERT INTO football_player 
        (name, number, photo, country) 
      VALUES
        ('${player.name}', '${player.number}', '${player.photo}', ${country.id});
      ''';

  @override
  String updateFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  }) =>
      '''
      UPDATE football_player SET
      name = '${player.name}',
      number = '${player.number}',
      photo = '${player.photo}',
      country = ${country.id}
      WHERE ID = ${player.id};
      ''';

  @override
  String getAllFootballPlayers() => '''
    SELECT * FROM football_player;
  ''';

  @override
  String getAllFootballPlayersFromCountry(CountryModel country) => '''
    SELECT * FROM football_player where country = ${country.id};
  ''';

  @override
  String deleteFootballPlayer(FootballPlayerModel player) => '''
    DELETE from football_player where id = ${player.id};
  ''';
}
