import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_garden/providers/plants_provider.dart';

class PlantDetailPage extends ConsumerWidget {
  final int id;

  const PlantDetailPage(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plantState = ref.watch(plantProvider(id));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
      ),
      body: switch (plantState) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError() => Center(
            child: Text(
              'Error fetching plant',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        AsyncData(:final value) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    value.assetPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    value.name,
                    style: TextStyle(
                      fontFamily: GoogleFonts.tinos().fontFamily,
                      fontSize: 36.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  value.description,
                  style:
                      GoogleFonts.roboto(color: Colors.white, fontSize: 18.0),
                )
              ],
            ),
          ),
      },
    );
  }
}
