// ignore_for_file: public_member_api_docs, sort_constructors_first

class FootballPlayerModel {
  int? id;
  final String name;
  final String number;
  final String photo;

  FootballPlayerModel({
    id,
    required this.name,
    required this.number,
    required this.photo,
  });

  factory FootballPlayerModel.fromMap(Map<String, dynamic> map) {
    return FootballPlayerModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      number: map['number'] as String,
      photo: map['photo'] as String,
    );
  }

  static List<FootballPlayerModel> fromMapList(
    List<Map<String, dynamic>> listMap,
  ) {
    List<FootballPlayerModel> result = [];
    for (final map in listMap) {
      result.add(FootballPlayerModel.fromMap(map));
    }
    return result;
  }
}
