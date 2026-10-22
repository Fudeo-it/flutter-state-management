import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCartButton extends StatelessWidget {
  final GestureTapCallback? onPressed;

  const AddToCartButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 50.0,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Row(
        spacing: 8.0,
        children: [
          const Icon(Icons.shopping_cart_outlined, size: 20.0),
          Text(
            'Aggiungi',
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    ),
  );
}
