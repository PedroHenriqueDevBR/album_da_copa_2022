import 'football_player.dart';

class CountryModel {
  int? id;
  final String flag;
  final String name;
  final List<FootballPlayerModel> figures;

  CountryModel({
    id,
    required this.flag,
    required this.name,
    required this.figures,
  });
}
