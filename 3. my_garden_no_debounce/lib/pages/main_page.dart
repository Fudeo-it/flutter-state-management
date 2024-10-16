import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_garden/blocs/plants/plants_bloc.dart';
import 'package:my_garden/widgets/plant_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => PlantsBloc(
      plantsRepository: context.read(),
    )..fetch(),
    child: BlocBuilder<PlantsBloc, PlantsState>(
      builder: (context, state) {
        final loading = state is FetchingPlantsState;
        final errorText =
        state is ErrorFetchingPlantsState ? state.error : null;

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: TextField(
              controller: _searchController,
              enabled: !loading,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Search...',
                label: const Text('Search'),
                errorText: errorText,
                prefixIcon: const Icon(Icons.search),
              ),
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18.0,
              ),
              onChanged: (query) => _search(context, query),
            ),
            toolbarHeight: 120,
          ),
          body: BlocBuilder<PlantsBloc, PlantsState>(
            builder: (context, state) => switch (state) {
              FetchingPlantsState() => const Center(
                child: CircularProgressIndicator(),
              ),
              FetchedPlantsState(:final plants) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 36.0),
                itemBuilder: (context, index) {
                  final plant = plants[index];

                  return PlantCard(plant);
                },
                itemCount: plants.length,
              ),
              NoPlantsState() => Center(
                child: Text(
                  'No plants found',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
              ErrorFetchingPlantsState(:final error) => Center(
                child: Text(
                  error,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
              _ => const SizedBox.shrink(),
            },
          ),
        );
      },
    ),
  );

  void _search(BuildContext context, String query) {
    context.read<PlantsBloc>().search(query);
  }
}
