import '../../../data/models/country_model.dart';
import '../../interfaces/country_dao.dart';

class UpdateCountryCommand {
  final CountryDao countryDao;

  UpdateCountryCommand({
    required this.countryDao,
  });

  Future<int> call({required CountryModel country}) =>
      countryDao.createCountry(country: country);
}
