import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_garden/models/plant.dart';
import 'package:my_garden/notifiers/search_notifier.dart';
import 'package:my_garden/repositories/plants_repository.dart';

const _debounceTime = Duration(milliseconds: 250);

final plantsProvider =
    FutureProvider<List<Plant>>(isAutoDispose: true, (ref) async {
  final plantsRepository = ref.watch(plantsRepositoryProvider);
  final query = ref.watch(searchQueryProvider);

  await ref.debounce();

  if (query.isEmpty) return plantsRepository.plants;

  return plantsRepository.search(query);
});

extension on Ref {
  Future<void> debounce() async {
    var didDispose = false;
    onDispose(() => didDispose = true);

    await Future.delayed(_debounceTime);

    if (didDispose) throw Exception('Cancelled');
  }
}