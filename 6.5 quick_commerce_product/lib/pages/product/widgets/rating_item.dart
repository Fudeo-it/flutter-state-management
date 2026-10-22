import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/models/product/product.dart';

class RatingItem extends StatelessWidget {
  final Product product;

  const RatingItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) => Row(
    spacing: 4.0,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star_rounded,
        color: Theme.of(context).primaryColor,
        size: 22.0,
      ),
      Text(
        product.rating.toStringAsFixed(1),
        style: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
        ),
      ),
      Text(
        '(${product.reviews} recensioni)',
        style: GoogleFonts.plusJakartaSans(
          color: const Color(0xFF5A7A6E),
          fontSize: 14.0,
        ),
      ),
    ],
  );
}
