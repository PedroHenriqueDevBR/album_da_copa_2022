import '../models/country_model.dart';
import '../models/football_player.dart';

class FootballPlayerSqlQueries {
  String createFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  }) {
    return '''
      INSERT INTO football_player 
        (name, number, photo, country) 
      VALUES
        ('${player.name}', '${player.number}', '${player.photo}', ${country.id});
    ''';
  }

  String getAllFootballPlayers() => '''
    SELECT * FROM football_player;
  ''';

  String getAllFootballPlayersFromCountry(CountryModel country) => '''
    SELECT * FROM football_player where country = ${country.id};
  ''';

  String deleteFootballPlayer(FootballPlayerModel player) {
    return '''
      DELETE from football_player where id = ${player.id};
    ''';
  }

  String updateFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  }) {
    return '''
      UPDATE football_player SET
      name = '${player.name}',
      number = '${player.number}',
      photo = '${player.photo}',
      country = ${country.id}
      WHERE ID = ${player.id};
    ''';
  }
}
