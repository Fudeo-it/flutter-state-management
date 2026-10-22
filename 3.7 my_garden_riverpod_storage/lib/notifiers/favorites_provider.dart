import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_garden/models/plant.dart';
import 'package:path/path.dart';
import 'package:riverpod_sqflite/riverpod_sqflite.dart';
import 'package:sqflite/sqflite.dart';

final storageProvider = FutureProvider<Storage<String, String>>(
    (ref) async => JsonSqFliteStorage.open(
          join(await getDatabasesPath(), 'my_garden.db'),
        ));

final favoritesProvider =
    AsyncNotifierProvider<FavoritesNotifier, Set<Plant>>(FavoritesNotifier.new);

class FavoritesNotifier extends AsyncNotifier<Set<Plant>> {
  @override
  FutureOr<Set<Plant>> build() {
    persist(ref.watch(storageProvider.future),
        key: 'favorites',
        encode: (plants) => jsonEncode(
              plants.map((plant) => plant.toJson()).toList(growable: false),
            ),
        decode: (json) => (jsonDecode(json) as List)
            .map((plant) => Plant.fromJson(plant as Map<String, dynamic>))
            .toSet(),
        options: const StorageOptions(
          cacheTime: StorageCacheTime.unsafe_forever,
        ));

    return const {};
  }

  void toggle(Plant plant) {
    final favorites = Set<Plant>.of(state.value ?? const {});

    if (favorites.contains(plant)) {
      favorites.remove(plant);
    } else {
      favorites.add(plant);
    }

    state = AsyncData(favorites);
  }
}
