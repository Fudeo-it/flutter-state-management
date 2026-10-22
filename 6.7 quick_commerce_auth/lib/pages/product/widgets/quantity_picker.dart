import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityPicker extends StatelessWidget {
  final int quantity;
  final ValueChanged<int>? onChanged;

  const QuantityPicker(this.quantity, {super.key, this.onChanged});

  @override
  Widget build(BuildContext context) => Container(
    height: 50.0,
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(50.0),
    ),
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            final newQuantity = quantity - 1;
            if (newQuantity > 0) {
              onChanged?.call(newQuantity);
            }
          },
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
          icon: Icon(Icons.remove, size: 18.0),
        ),
        Text(
          quantity.toString(),
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        IconButton(
          onPressed: () {
            onChanged?.call(quantity + 1);
          },
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
          icon: Icon(Icons.add, size: 18.0),
        ),
      ],
    ),
  );
}
