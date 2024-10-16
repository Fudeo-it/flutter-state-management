import 'package:my_garden/models/plant.dart';

class PlantsRepository {
  static const List<Plant> _plants = [
    Plant(
      name: 'Sansevieria',
      assetPath: 'assets/plants/Sansevieria.jpg',
    ),
    Plant(
      name: 'Anthurium',
      assetPath: 'assets/plants/Anthurium.jpg',
    ),
    Plant(
      name: 'Schefflera',
      assetPath: 'assets/plants/Schefflera.jpg',
    ),
    Plant(
      name: 'Crassula',
      assetPath: 'assets/plants/Crassula.jpg',
    ),
    Plant(
      name: 'Dracena',
      assetPath: 'assets/plants/Dracena.jpg',
    ),
    Plant(
      name: 'Monstera',
      assetPath: 'assets/plants/Monstera.jpg',
    ),
    Plant(
      name: 'Aloe',
      assetPath: 'assets/plants/Aloe.jpg',
    ),
    Plant(
      name: 'Spatifillo',
      assetPath: 'assets/plants/Spatifillo.jpg',
    ),
  ];

  Future<List<Plant>> get plants async {
    await Future.delayed(const Duration(seconds: 3));

    return _plants;
  }

  Future<List<Plant>> search(String query) async {
    await Future.delayed(const Duration(seconds: 3));

    return _plants
        .where((plant) => plant.name.toLowerCase().contains(query.toLowerCase()))
        .toList(growable: false);
  }
}
