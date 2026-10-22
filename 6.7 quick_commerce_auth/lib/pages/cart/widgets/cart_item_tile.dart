import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/misc/formatters/currency_formatter.dart';
import 'package:quick_commerce_app/models/product/product.dart';

class CartItemTile extends StatelessWidget {
  final Product product;
  final int quantity;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDecrement;
  final GestureTapCallback? onIncrement;

  const CartItemTile(
    this.product, {
    super.key,
    this.quantity = 1,
    this.onTap,
    this.onDecrement,
    this.onIncrement,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(24.0),
    child: Ink(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Theme.of(
                      context,
                    ).inputDecorationTheme.labelStyle?.color,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  product.category,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: const Color(0xFF4C9A79),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  CurrencyFormatter().format(product.price),
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Theme.of(
                      context,
                    ).inputDecorationTheme.labelStyle?.color,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                color:
                    Theme.of(
                      context,
                    ).inputDecorationTheme.border?.borderSide.color ??
                    Colors.transparent,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: onDecrement,
                  child: Container(
                    height: 28.0,
                    width: 28.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 16.0,
                      color: Theme.of(
                        context,
                      ).inputDecorationTheme.labelStyle?.color,
                    ),
                  ),
                ),
                SizedBox(
                  width: 32.0,
                  child: Text(
                    quantity.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onIncrement,
                  child: Container(
                    height: 28.0,
                    width: 28.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      size: 16.0,
                      color: Theme.of(
                        context,
                      ).inputDecorationTheme.labelStyle?.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
