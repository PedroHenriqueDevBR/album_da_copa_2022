import 'package:album_da_copa_2022/features/album/data/models/football_player.dart';
import 'package:album_da_copa_2022/features/album/domain/interfaces/football_player_dao.dart';

import '../../../data/models/country_model.dart';

class FetchPlayersByCountryQuery {
  final FootballPlayerDao playerDao;

  FetchPlayersByCountryQuery({required this.playerDao});

  Future<List<FootballPlayerModel>> call(CountryModel country) =>
      playerDao.getFootbalPlayersByCountry(country: country);
}
