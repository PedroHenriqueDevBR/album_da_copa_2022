import '../../../data/models/country_model.dart';
import '../../interfaces/country_dao.dart';

class UpdateCountryCommand {
  final CountryDao countryDao;

  UpdateCountryCommand({required this.countryDao});

  Future<void> call({required CountryModel country}) =>
      countryDao.updateCountry(country: country);
}
