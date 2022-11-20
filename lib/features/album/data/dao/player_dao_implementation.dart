import 'package:sqflite/sqlite_api.dart';

import '../../../../shared/errors/custom_exceptions.dart';
import '../../domain/interfaces/football_player_dao.dart';
import '../datasources/sqlite_datasource.dart';
import '../models/country_model.dart';
import '../models/football_player.dart';
import '../queries/football_player_queries.dart';

class FootballPlayerDaoImplementation implements FootballPlayerDao {
  final FootballPlayerSqlQueries playerQueries;
  final ConnectionDatabase connection;

  FootballPlayerDaoImplementation({
    required this.playerQueries,
    required this.connection,
  });

  Future<Database> get database async => await connection.db;

  @override
  Future<int> createFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  }) async {
    try {
      final db = await database;
      final createdId = db.rawInsert(playerQueries.createFootballPlayer(
        player: player,
        country: country,
      ));
      return createdId;
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<void> updateFootballPlayer({
    required FootballPlayerModel player,
    required CountryModel country,
  }) async {
    try {
      final db = await database;
      final affectedRows = await db.rawUpdate(
        playerQueries.updateFootballPlayer(
          player: player,
          country: country,
        ),
      );
      if (affectedRows == 0) throw NotFoundException();
    } on NotFoundException {
      rethrow;
    }
  }

  @override
  Future<List<FootballPlayerModel>> getAllFootbalPlayers() async {
    try {
      final db = await database;
      final response = await db.rawQuery(
        playerQueries.getAllFootballPlayers(),
      );
      List<FootballPlayerModel> players = FootballPlayerModel.fromMapList(
        response,
      );
      return players;
    } catch (error) {
      throw Exception();
    }
  }

  @override
  Future<List<FootballPlayerModel>> getFootbalPlayersByCountry({
    required CountryModel country,
  }) async {
    try {
      final db = await database;
      final response = await db.rawQuery(
        playerQueries.getAllFootballPlayersFromCountry(country),
      );
      List<FootballPlayerModel> players = FootballPlayerModel.fromMapList(
        response,
      );
      return players;
    } catch (error) {
      throw Exception();
    }
  }

  @override
  Future<void> deleteFootballPlayer({
    required FootballPlayerModel player,
  }) async {
    try {
      final db = await database;
      final affectedRows = await db.rawDelete(
        playerQueries.deleteFootballPlayer(player),
      );
      if (affectedRows == 0) throw NotFoundException();
    } on NotFoundException {
      rethrow;
    }
  }
}
