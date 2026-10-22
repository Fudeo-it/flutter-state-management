import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_garden/models/plant.dart';

final plantsRepositoryProvider = Provider<PlantsRepository>(
    (ref) => PlantsRepository()
);

class PlantsRepository {
  static const List<Plant> _plants = [
    Plant(
      id: 1,
      name: 'Sansevieria',
      description:
          'Nearly indestructible, it tolerates low light and long gaps between waterings.',
      assetPath: 'assets/plants/Sansevieria.jpg',
    ),
    Plant(
      id: 2,
      name: 'Anthurium',
      description:
          'Known for its glossy red blooms, it thrives in warm and humid rooms.',
      assetPath: 'assets/plants/Anthurium.jpg',
    ),
    Plant(
      id: 3,
      name: 'Schefflera',
      description:
          'A fast growing shrub with umbrella shaped leaves, happy in bright indirect light.',
      assetPath: 'assets/plants/Schefflera.jpg',
    ),
    Plant(
      id: 4,
      name: 'Crassula',
      description:
          'A succulent that stores water in its thick leaves, so water it sparingly.',
      assetPath: 'assets/plants/Crassula.jpg',
    ),
    Plant(
      id: 5,
      name: 'Dracena',
      description:
          'An elegant plant with narrow arching leaves, it dislikes cold draughts.',
      assetPath: 'assets/plants/Dracena.jpg',
    ),
    Plant(
      id: 6,
      name: 'Monstera',
      description:
          'Its large split leaves need room to grow and a support to climb on.',
      assetPath: 'assets/plants/Monstera.jpg',
    ),
    Plant(
      id: 7,
      name: 'Aloe',
      description:
          'A succulent that loves sunlight, its leaves contain a soothing gel.',
      assetPath: 'assets/plants/Aloe.jpg',
    ),
    Plant(
      id: 8,
      name: 'Spatifillo',
      description:
          'The peace lily blooms even in shade and tells you when it needs water.',
      assetPath: 'assets/plants/Spatifillo.jpg',
    ),
  ];

  Future<List<Plant>> get plants async {
    // await Future.delayed(const Duration(seconds: 3));

    return _plants;
  }

  Future<List<Plant>> search(String query) async {
    // await Future.delayed(const Duration(seconds: 3));

    return _plants
        .where(
          (plant) => plant.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList(growable: false);
  }

  Future<Plant> plant(int id) async {
    await Future.delayed(const Duration(seconds: 1));

    final plant = _plants.where((plant) => plant.id == id).firstOrNull;

    if (plant == null) throw Exception('Plant not found');

    return plant;
  }
}