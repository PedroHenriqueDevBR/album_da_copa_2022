import 'package:flutter/animation.dart';

import 'football_player.dart';

class CountryModel {
  final String flag;
  final String name;
  final List<Color> colors;
  final List<FigureModel> figures;

  CountryModel({
    required this.flag,
    required this.name,
    required this.figures,
    required this.colors,
  });
}
