import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) => Column(
    spacing: 4.0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        spacing: 4.0,
        children: [
          Text(
            'CONSEGNA A',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: Colors.grey.shade500,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      Row(
        spacing: 4.0,
        children: [
          Icon(
            Icons.location_on,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          Text(
            'Casa',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
            ),
          ),
        ],
      ),
    ],
  );
}
