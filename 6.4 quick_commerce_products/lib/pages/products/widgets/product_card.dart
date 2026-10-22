import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/misc/formatters/currency_formatter.dart';
import 'package:quick_commerce_app/models/product/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onIncrement;

  const ProductCard(this.product, {super.key, this.onTap, this.onIncrement});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20.0),
    child: Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10.0,
            offset: const Offset(0, 4.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 12.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 4.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 15.0,
                          color: Theme.of(
                            context,
                          ).inputDecorationTheme.labelStyle?.color,
                        ),
                      ),
                      Text(
                        '${product.quantity} disponibili',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        CurrencyFormatter().format(product.price),
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 18.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      InkWell(
                        onTap: onIncrement,
                        borderRadius: BorderRadius.circular(18.0),
                        child: Ink(
                          width: 36.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withValues(alpha: 0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 4.0),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
