import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/models/product/product.dart';

class CategoryItem extends StatelessWidget {
  final Product product;

  const CategoryItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) => Row(
    spacing: 4.0,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.category_outlined, color: const Color(0xFF5A7A6E), size: 18.0),
      Text(
        product.category,
        style: GoogleFonts.plusJakartaSans(
          color: const Color(0xFF5A7A6E),
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        ),
      ),
    ],
  );
}
