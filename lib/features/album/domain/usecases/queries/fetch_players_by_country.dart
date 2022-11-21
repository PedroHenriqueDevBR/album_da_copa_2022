import '../../../data/models/country_model.dart';
import '../../../data/models/football_player.dart';
import '../../interfaces/football_player_dao.dart';

class FetchPlayersByCountryQuery {
  final FootballPlayerDao playerDao;

  FetchPlayersByCountryQuery({required this.playerDao});

  Future<List<FootballPlayerModel>> call(CountryModel country) =>
      playerDao.getFootbalPlayersByCountry(country: country);
}
