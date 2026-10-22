import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_garden/notifiers/search_notifier.dart';
import 'package:my_garden/pages/plant_detail_page.dart';
import 'package:my_garden/providers/plants_provider.dart';
import 'package:my_garden/widgets/plant_card.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final plantsState = ref.watch(plantsProvider);

    final loading = plantsState.isLoading;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            label: const Text('Search'),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: loading
                ? Container(
                    margin: const EdgeInsets.all(12.0),
                    width: 16.0,
                    height: 16.0,
                    child: const CircularProgressIndicator())
                : null,
          ),
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 18.0,
          ),
          onChanged: _search,
        ),
        toolbarHeight: 120,
      ),
      body: switch (plantsState) {
        AsyncError() => Center(
            child: Text(
              'Error fetching plants',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        AsyncData(value: []) => Center(
            child: Text(
              'No plants found',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        AsyncData(:final value) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemBuilder: (context, index) {
              final plant = value[index];

              return PlantCard(
                plant,
                onTap: () => _navigateToDetail(context, plant.id),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 36.0,
                ),
            itemCount: value.length),
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
      },
    );
  }

  void _search(String query) {
    ref.read(searchQueryProvider.notifier).update(query);
  }

  void _navigateToDetail(BuildContext context, int id) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PlantDetailPage(id)));
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }
}
