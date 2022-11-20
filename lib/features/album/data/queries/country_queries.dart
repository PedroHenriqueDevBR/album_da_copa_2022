import '../models/country_model.dart';

class CountrySqlQueries {
  String createCountry(CountryModel country) {
    return '''
      INSERT INTO country 
        (flag, name)
      values
        ('${country.flag}', '${country.name}');
    ''';
  }

  String getAllCountries() => '''
    SELECT * FROM country;
  ''';

  String deleteCountry(CountryModel country) {
    return '''
      DELETE FROM country WHERE id = ${country.id};
    ''';
  }

  String udpateCountry(CountryModel country) {
    return '''
      UPDATE country SET
      flag = '${country.flag}',
      name = '${country.name}'
      WHERE ID = ${country.id};
    ''';
  }
}
