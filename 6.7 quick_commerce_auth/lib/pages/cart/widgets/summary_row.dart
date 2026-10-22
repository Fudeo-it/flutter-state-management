import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/misc/formatters/currency_formatter.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final double amount;
  final Color? amountColor;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.amountColor,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade500,
        ),
      ),
      Text(
        CurrencyFormatter().format(amount),
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: amountColor,
        ),
      ),
    ],
  );
}
