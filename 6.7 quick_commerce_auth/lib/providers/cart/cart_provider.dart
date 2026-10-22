import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:quick_commerce_app/models/cart_item/cart_item.dart';
import 'package:quick_commerce_app/models/product/product.dart';
import 'package:riverpod_sqflite/riverpod_sqflite.dart';
import 'package:sqflite/sqflite.dart';

final storageProvider = FutureProvider.autoDispose<Storage<String, String>>((
  ref,
) async {
  return JsonSqFliteStorage.open(join(await getDatabasesPath(), 'riverpod.db'));
});

final cartProvider = AsyncNotifierProvider<CartNotifier, List<CartItem>>(
  CartNotifier.new,
);

class CartNotifier extends AsyncNotifier<List<CartItem>> {
  @override
  FutureOr<List<CartItem>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      key: 'Cart',
      encode: jsonEncode,
      decode: (encoded) {
        return (jsonDecode(encoded) as List)
            .map((item) => CartItem.fromJson(item as Map<String, dynamic>))
            .toList(growable: false);
      },
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    ).future;

    return state.value ?? [];
  }

  Future<void> addProduct(Product product, {int quantity = 1}) async {
    final currentCart = _currentCart;

    currentCart.putIfAbsent(product, () => 0);
    currentCart[product] = currentCart[product]! + quantity;

    final updatedCart = currentCart.entries
        .map((entry) => entry.toCartItem)
        .toList(growable: false);

    state = AsyncData(updatedCart);
  }

  Future<void> removeProduct(Product product) async {
    final currentCart = _currentCart;

    if (!currentCart.containsKey(product)) {
      return;
    }

    currentCart[product] = currentCart[product]! - 1;
    if (currentCart[product]! <= 0) {
      currentCart.remove(product);
    }

    final updatedCart = currentCart.entries
        .map((entry) => entry.toCartItem)
        .toList(growable: false);

    state = AsyncData(updatedCart);
  }

  Map<Product, int> get _currentCart =>
      Map.fromEntries((state.value ?? []).map((cart) => cart.toMapEntry));
}
