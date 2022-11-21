import 'package:sqflite/sqlite_api.dart';

import '../../../../shared/errors/custom_exceptions.dart';
import '../../domain/interfaces/country_dao.dart';
import '../datasources/sqlite_datasource.dart';
import '../models/country_model.dart';
import '../queries/country_queries.dart';

class CountryDaoImplementation implements CountryDao {
  late final CountrySqlQueries _countryQueries;
  late final ConnectionDatabase _connection;

  CountryDaoImplementation({
    required CountrySqlQueries countryQueries,
    required ConnectionDatabase connection,
  }) {
    _countryQueries = countryQueries;
    _connection = connection;
  }

  Future<Database> get database async => await _connection.db;

  @override
  Future<int> createCountry({
    required CountryModel country,
  }) async {
    try {
      final db = await database;
      final createdId =
          await db.rawInsert(_countryQueries.createCountry(country));
      return createdId;
    } on ServerException {
      rethrow;
    } on DatabaseException catch (error) {
      if (error.isUniqueConstraintError()) {
        throw RegisteredDataException();
      }
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
        _countryQueries.updateCountry(country),
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
          await db.rawQuery(_countryQueries.getAllCountries());
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
        _countryQueries.deleteCountry(country),
      );
      if (affectedRows == 0) throw NotFoundException();
    } on NotFoundException {
      rethrow;
    }
  }
}
