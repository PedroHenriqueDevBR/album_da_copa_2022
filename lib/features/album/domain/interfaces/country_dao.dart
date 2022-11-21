import '../../data/models/country_model.dart';

abstract class CountryDao {
  Future<List<CountryModel>> getAllCountries();

  Future<int> createCountry({required CountryModel country});

  Future<void> deleteCountry({required CountryModel country});

  Future<void> updateCountry({required CountryModel country});
}
