import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/misc/formatters/currency_formatter.dart';
import 'package:quick_commerce_app/models/product/product.dart';
import 'package:quick_commerce_app/pages/product/widgets/buttons/add_to_cart_button.dart';
import 'package:quick_commerce_app/pages/product/widgets/category_item.dart';
import 'package:quick_commerce_app/pages/product/widgets/description_section.dart';
import 'package:quick_commerce_app/pages/product/widgets/dot_separator.dart';
import 'package:quick_commerce_app/pages/product/widgets/quantity_picker.dart';
import 'package:quick_commerce_app/pages/product/widgets/rating_item.dart';
import 'package:quick_commerce_app/providers/product/product_provider.dart';
import 'package:quick_commerce_app/widgets/loading_widget.dart';

class ProductPage extends ConsumerStatefulWidget {
  final int productId;

  const ProductPage(this.productId, {super.key});

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(getProductProvider(widget.productId));
    final imageHeight = MediaQuery.sizeOf(context).height * 0.55;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: switch (productState) {
        AsyncLoading() => LoadingWidget(),
        AsyncError() => Center(
          child: Text(
            'Si è verificato un errore durante il caricamento del prodotto.',
          ),
        ),
        AsyncData(value: final product) => Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: imageHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentGeometry.center,
                      colors: [
                        Colors.black.withValues(alpha: 0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                margin: EdgeInsets.only(top: imageHeight - 40),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(
                  left: 24.0,
                  top: 24.0,
                  right: 24.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(
                            context,
                          ).inputDecorationTheme.labelStyle?.color,
                          height: 1.2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            RatingItem(product),
                            DotSeparator(),
                            CategoryItem(product),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: DescriptionSection(product),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      },
      bottomNavigationBar: switch (productState) {
        AsyncData(value: final product) => SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade100)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10.0,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              spacing: 12.0,
              children: [
                Text(
                  CurrencyFormatter().format(product.price),
                  style: GoogleFonts.plusJakartaSans(
                    color: Theme.of(
                      context,
                    ).inputDecorationTheme.labelStyle?.color,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacer(),
                QuantityPicker(
                  _quantity,
                  onChanged: (quantity) => setState(() {
                    _quantity = quantity;
                  }),
                ),
                AddToCartButton(
                  onPressed: () => _addToCart(context, product: product),
                ),
              ],
            ),
          ),
        ),
        _ => null,
      },
    );
  }

  void _addToCart(BuildContext context, {required Product product}) {
    Navigator.of(context).maybePop();
  }
}
