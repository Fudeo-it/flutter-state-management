import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/models/product/product.dart';

class DescriptionSection extends StatelessWidget {
  final Product product;

  const DescriptionSection(this.product, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 8.0,
    children: [
      Text(
        'Descrizione',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
        ),
      ),
      Text(
        product.description,
        style: GoogleFonts.notoSans(
          fontSize: 15.0,
          color: const Color(0xFF5A7A6E),
          height: 1.6,
        ),
      ),
    ],
  );
}
