import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/models/product/product.dart';
import 'package:quick_commerce_app/pages/product/product_page.dart';
import 'package:quick_commerce_app/pages/products/widgets/appbar_title.dart';
import 'package:quick_commerce_app/pages/products/widgets/buttons/see_all_button.dart';
import 'package:quick_commerce_app/pages/products/widgets/category_filter.dart';
import 'package:quick_commerce_app/pages/products/widgets/product_card.dart';
import 'package:quick_commerce_app/pages/products/widgets/search_field.dart';
import 'package:quick_commerce_app/providers/cart/cart_provider.dart';
import 'package:quick_commerce_app/providers/product/product_provider.dart';
import 'package:quick_commerce_app/widgets/loading_widget.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(fetchProductsProvider);

    return Scaffold(
      appBar: AppBar(title: AppBarTitle()),
      body: switch (productsState) {
        AsyncLoading() => const LoadingWidget(),
        AsyncError() => Center(
          child: Text(
            'Si è verificato un errore durante il caricamento dei prodotti.',
          ),
        ),
        AsyncData(value: []) => Center(
          child: Text('Non ci sono prodotti disponibili.'),
        ),
        AsyncData(value: final products) => SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchField(),
              const CategoryFilter(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'In evidenza',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(
                          context,
                        ).inputDecorationTheme.labelStyle?.color,
                      ),
                    ),
                    SeeAllButton(onPressed: () {}),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      product,
                      onTap: () => _navigateToProductPage(context, product.id),
                      onIncrement: () => _addProductToCart(ref, product: product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      },
    );
  }

  void _navigateToProductPage(BuildContext context, int id) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ProductPage(id)));
  }

  void _addProductToCart(WidgetRef ref, {required Product product}) {
    ref.read(cartProvider.notifier).addProduct(product);
  }
}
