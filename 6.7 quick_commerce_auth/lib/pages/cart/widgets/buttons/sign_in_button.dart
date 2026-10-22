import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/misc/formatters/currency_formatter.dart';

class SignInButton extends StatelessWidget {
  final double totalPrice;
  final GestureTapCallback? onTap;

  const SignInButton(this.totalPrice, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 32.0),
    color: Colors.white.withValues(alpha: 0.9),
    child: SizedBox(
      height: 64.0,
      child: FilledButton(
        onPressed: onTap,
        child: Row(
          spacing: 12.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_outline_rounded,
              size: 20.0,
              color: Colors.white,
            ),
            Text('Accedi per il Checkout'),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                CurrencyFormatter().format(totalPrice),
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
