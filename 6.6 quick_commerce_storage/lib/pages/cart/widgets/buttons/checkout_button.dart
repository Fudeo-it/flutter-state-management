import 'package:flutter/material.dart';
import 'package:quick_commerce_app/misc/formatters/currency_formatter.dart';

class CheckoutButton extends StatelessWidget {
  final double totalPrice;
  final GestureTapCallback? onTap;

  const CheckoutButton(this.totalPrice, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 32.0),
    color: Colors.white.withValues(alpha: 0.9),
    child: SizedBox(
      height: 64.0,
      child: ElevatedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Checkout'),
            Row(
              spacing: 8.0,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    CurrencyFormatter().format(totalPrice),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_rounded, size: 20.0),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
