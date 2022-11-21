import '../../../data/models/country_model.dart';
import '../../interfaces/country_dao.dart';

class DeleteCountryCommand {
  final CountryDao countryDao;

  DeleteCountryCommand({required this.countryDao});

  Future<void> call({required CountryModel country}) =>
      countryDao.deleteCountry(country: country);
}
