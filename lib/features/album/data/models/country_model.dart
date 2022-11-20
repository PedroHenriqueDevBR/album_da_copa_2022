// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'football_player.dart';

class CountryModel {
  int? id;
  String flag;
  String name;
  final List<FootballPlayerModel> figures;

  CountryModel({
    id,
    required this.flag,
    required this.name,
    required this.figures,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'] != null ? map['id'] as int : null,
      flag: map['flag'] as String,
      name: map['name'] as String,
      figures: [],
    );
  }

  static List<CountryModel> fromMapList(List<Map<String, dynamic>> listMap) {
    List<CountryModel> result = [];
    for (final map in listMap) {
      result.add(CountryModel.fromMap(map));
    }
    return result;
  }
}
