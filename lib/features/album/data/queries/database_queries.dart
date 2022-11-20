class DatabaseSQLQueries {
  static const databaseName = 'world_cup_figures';
  static const country = 'country';
  static const footballPlayer = 'football_player';

  static const countryCreatorSql = """
  CREATE TABLE "$country" (
    "id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    "flag"	TEXT NOT NULL,
    "name"	TEXT NOT NULL
  );
  """;

  static const footballPlayerCreatorSql = """
  CREATE TABLE "$footballPlayer" (
    "id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    "name"	TEXT NOT NULL,
    "number"	TEXT NOT NULL,
    "photo"	TEXT,
    "country"	INTEGER NOT NULL,
    FOREIGN KEY("country") REFERENCES "country"("id")
  );
  """;
}
