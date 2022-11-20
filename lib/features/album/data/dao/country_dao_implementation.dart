import 'package:sqflite/sqlite_api.dart';

import '../../../../shared/errors/custom_exceptions.dart';
import '../../domain/interfaces/country_dao.dart';
import '../datasources/sqlite_datasource.dart';
import '../models/country_model.dart';
import '../queries/country_queries.dart';

class CountryDaoImplementation implements CountryDao {
  final CountrySqlQueries countryQueries;
  final ConnectionDatabase connection;

  CountryDaoImplementation({
    required this.countryQueries,
    required this.connection,
  });

  Future<Database> get database async => await connection.db;

  @override
  Future<int> createCountry({
    required CountryModel country,
  }) async {
    try {
      final db = await database;
      final createdId = db.rawInsert(countryQueries.createCountry(country));
      return createdId;
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<void> updateCountry({
    required CountryModel country,
  }) async {
    try {
      final db = await database;
      final affectedRows = await db.rawUpdate(
        countryQueries.updateCountry(country),
      );
      if (affectedRows == 0) throw NotFoundException();
    } on NotFoundException {
      rethrow;
    }
  }

  @override
  Future<List<CountryModel>> getAllCountries() async {
    try {
      final db = await database;
      List<Map<String, dynamic>> response =
          await db.rawQuery(countryQueries.getAllCountries());
      List<CountryModel> countries = CountryModel.fromMapList(response);
      return countries;
    } catch (error) {
      throw Exception();
    }
  }

  @override
  Future<void> deleteCountry({
    required CountryModel country,
  }) async {
    try {
      final db = await database;
      final affectedRows = await db.rawDelete(
        countryQueries.deleteCountry(country),
      );
      if (affectedRows == 0) throw NotFoundException();
    } on NotFoundException {
      rethrow;
    }
  }
}
