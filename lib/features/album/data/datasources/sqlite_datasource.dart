import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../queries/database_queries.dart';

abstract class ConnectionDatabase {
  Future<Database> get db;
}

class SQFLiteConnection implements ConnectionDatabase {
  SQFLiteConnection._();

  static SQFLiteConnection? _sqfliteConnection;

  static SQFLiteConnection get instance {
    _sqfliteConnection ??= SQFLiteConnection._();
    return _sqfliteConnection!;
  }

  static const databaseVersion = 1;
  Database? _db;

  @override
  Future<Database> get db => _openDatabaseConnection();

  Future<Database> _openDatabaseConnection() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, DatabaseSQLQueries.databaseName);

    _db ??= await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
    return _db!;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.transaction((reference) async {
      reference.execute(DatabaseSQLQueries.countryCreatorSql);
      reference.execute(DatabaseSQLQueries.footballPlayerCreatorSql);
    });
  }
}
