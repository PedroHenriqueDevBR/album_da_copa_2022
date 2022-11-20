import '../models/country_model.dart';

abstract class CountrySqlQueries {
  String createCountry(CountryModel country);

  String getAllCountries();

  String deleteCountry(CountryModel country);

  String updateCountry(CountryModel country);
}

class CountrySqlQueriesImplementation implements CountrySqlQueries {
  @override
  String createCountry(CountryModel country) {
    return '''
      INSERT INTO country 
        (flag, name)
      values
        ('${country.flag}', '${country.name}');
    ''';
  }

  @override
  String getAllCountries() => '''
    SELECT * FROM country;
  ''';

  @override
  String deleteCountry(CountryModel country) {
    return '''
      DELETE FROM country WHERE id = ${country.id};
    ''';
  }

  @override
  String updateCountry(CountryModel country) {
    return '''
      UPDATE country SET
      flag = '${country.flag}',
      name = '${country.name}'
      WHERE ID = ${country.id};
    ''';
  }
}
