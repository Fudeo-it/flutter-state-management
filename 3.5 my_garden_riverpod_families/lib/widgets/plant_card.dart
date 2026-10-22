import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_garden/models/plant.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  final GestureTapCallback? onTap;

  const PlantCard(this.plant, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: onTap,
              child: Image.asset(
                plant.assetPath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                plant.name,
                style: TextStyle(
                  fontFamily: GoogleFonts.tinos().fontFamily,
                  fontSize: 36.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      );
}
