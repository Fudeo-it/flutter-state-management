import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsetsGeometry.symmetric(horizontal: 16.0, vertical: 12.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Cerca prodotti, marche e altro',
        hintStyle: GoogleFonts.plusJakartaSans(
          color: Colors.grey.shade400,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
  );
}
