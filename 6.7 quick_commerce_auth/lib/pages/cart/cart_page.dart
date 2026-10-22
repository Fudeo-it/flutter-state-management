import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_commerce_app/models/cart_item/cart_item.dart';
import 'package:quick_commerce_app/models/product/product.dart';
import 'package:quick_commerce_app/pages/cart/widgets/buttons/checkout_button.dart';
import 'package:quick_commerce_app/pages/cart/widgets/buttons/sign_in_button.dart';
import 'package:quick_commerce_app/pages/cart/widgets/cart_item_tile.dart';
import 'package:quick_commerce_app/pages/cart/widgets/order_summary.dart';
import 'package:quick_commerce_app/pages/cart/widgets/promo_code_tile.dart';
import 'package:quick_commerce_app/pages/product/product_page.dart';
import 'package:quick_commerce_app/pages/sign_in/sign_in_page.dart';
import 'package:quick_commerce_app/providers/auth/auth_provider.dart';
import 'package:quick_commerce_app/providers/cart/cart_provider.dart';
import 'package:quick_commerce_app/widgets/loading_widget.dart';

const _fees = 2.99;

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final authenticated = ref.watch(authProvider).value != null;

    return Scaffold(
      appBar: AppBar(title: Text('Il mio carrello'), centerTitle: true),
      body: switch (cartState) {
        AsyncLoading() => const LoadingWidget(),
        AsyncError() => Center(
          child: Text(
            'Si è verificato un errore durante il caricamento del carrello',
          ),
        ),
        AsyncData(value: []) => Center(child: Text('Il carrello è vuoto')),
        AsyncData(value: final cart) => CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  final CartItem(:product, :quantity) = cart[index];

                  return CartItemTile(
                    product,
                    quantity: quantity,
                    onTap: () => _navigateToProductPage(context, product.id),
                    onDecrement: () =>
                        _removeProductFromCart(ref, product: product),
                    onIncrement: () => _addProductToCart(ref, product: product),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 16.0),
                itemCount: cart.length,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 8.0,
              ),
              sliver: SliverToBoxAdapter(
                child: OrderSummary(
                  subtotal: cart.total,
                  deliveryFee: _fees,
                  taxes: cart.taxes,
                  total: cart.totalWithTaxesAndFees,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                bottom: 16.0,
              ),
              sliver: SliverToBoxAdapter(child: PromoCodeTile(onTap: () {})),
            ),
          ],
        ),
      },
      bottomNavigationBar: switch (cartState) {
        AsyncData(value: []) => null,
        AsyncData(value: final cart) when authenticated => CheckoutButton(
          cart.totalWithTaxesAndFees,
          onTap: () {},
        ),
        AsyncData(value: final cart) when !authenticated => SignInButton(
          cart.totalWithTaxesAndFees,
          onTap: () => _navigateToSignInPage(context),
        ),
        _ => null,
      },
    );
  }

  void _navigateToProductPage(BuildContext context, int productId) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ProductPage(productId)));
  }

  void _navigateToSignInPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignInPage()));
  }

  void _addProductToCart(WidgetRef ref, {required Product product}) {
    ref.read(cartProvider.notifier).addProduct(product);
  }

  void _removeProductFromCart(WidgetRef ref, {required Product product}) {
    ref.read(cartProvider.notifier).removeProduct(product);
  }
}

extension on List<CartItem> {
  double get total => fold(
    0.0,
    (previousValue, element) =>
        previousValue + (element.product.price * element.quantity),
  );

  double get taxes => total * 0.22;

  double get totalWithTaxesAndFees => total * 1.22 + _fees;
}
