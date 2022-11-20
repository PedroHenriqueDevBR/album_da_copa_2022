import '../../../data/models/country_model.dart';
import '../../interfaces/country_dao.dart';

class FetchCountriesQuery {
  final CountryDao countryDao;

  FetchCountriesQuery({required this.countryDao});

  Future<List<CountryModel>> call() => countryDao.getAllCountries();
}
