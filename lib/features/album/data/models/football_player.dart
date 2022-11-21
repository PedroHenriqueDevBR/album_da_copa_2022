class FootballPlayerModel {
  int? id;
  String name;
  String number;
  String photo;

  FootballPlayerModel({
    this.id,
    required this.name,
    required this.number,
    required this.photo,
  });

  factory FootballPlayerModel.fromMap(Map<String, dynamic> map) {
    return FootballPlayerModel(
      id: map['id'],
      name: map['name'],
      number: map['number'],
      photo: map['photo'],
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
