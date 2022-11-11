class FigureModel {
  final String name;
  final String number;
  final String photo;

  const FigureModel({
    required this.name,
    required this.number,
    required this.photo,
  });
}

class LegendyFigureModel extends FigureModel {
  LegendyFigureModel({
    required super.name,
    required super.number,
    required super.photo,
  });
}
