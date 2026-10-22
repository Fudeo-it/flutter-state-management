import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_commerce_app/models/product/product.dart';

final productServiceProvider = Provider<ProductService>(
  (ref) => const ProductService(),
);

class ProductService {
  const ProductService();

  Future<List<Product>> fetch() async {
    final raw = await rootBundle.loadString('assets/products.json');
    final json = jsonDecode(raw);
    final products = (json as List)
        .map((product) => Product.fromJson(product))
        .toList(growable: false);

    return products;
  }
}
