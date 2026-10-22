import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/misc/formatters/currency_formatter.dart';
import 'package:quick_commerce_app/pages/cart/widgets/summary_row.dart';

class OrderSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double taxes;
  final double total;

  const OrderSummary({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.taxes,
    required this.total,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RIEPILOGO DELL\'ORDINE',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.grey.shade400,
          ),
        ),
        const SizedBox(height: 16.0),
        SummaryRow(label: 'Subtotale', amount: subtotal),
        const SizedBox(height: 12.0),
        SummaryRow(
          label: 'Spese di Spedizione',
          amount: deliveryFee,
          amountColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 12.0),
        SummaryRow(label: 'Tasse', amount: taxes),
        const SizedBox(height: 16.0),
        const Divider(height: 1.0, color: Color(0xFFE5E7EB)),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Totale',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0D1B16),
              ),
            ),
            Text(
              CurrencyFormatter().format(total),
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22.0,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0D1B16),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
