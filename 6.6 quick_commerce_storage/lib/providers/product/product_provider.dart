import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_commerce_app/models/product/product.dart';
import 'package:quick_commerce_app/repositories/product_repository.dart';

final getProductProvider = FutureProvider.autoDispose.family<Product, int>((ref, id) async {
  final productRepository = ref.read(productRepositoryProvider);

  return productRepository.get(id);
});

final fetchProductsProvider = FutureProvider.autoDispose<List<Product>>((ref) async {
  final productRepository = ref.read(productRepositoryProvider);

  return productRepository.fetch();
});