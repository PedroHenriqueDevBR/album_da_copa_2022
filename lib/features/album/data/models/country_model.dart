import 'football_player.dart';

class CountryModel {
  final String flag;
  final String name;
  final List<FootballPlayerModel> players;

  CountryModel({
    required this.flag,
    required this.name,
    required this.players,
  });
}
