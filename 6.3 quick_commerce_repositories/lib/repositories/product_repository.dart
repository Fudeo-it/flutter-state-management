import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_commerce_app/models/product/product.dart';
import 'package:quick_commerce_app/services/product_service.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final productService = ref.read(productServiceProvider);

  return ProductRepository(productService: productService);
});

class ProductRepository {
  final ProductService productService;

  const ProductRepository({required this.productService});

  Future<List<Product>> fetch() async {
    await Future.delayed(const Duration(seconds: 3));

    return await productService.fetch();
  }

  Future<Product> get(int id) async {
    await Future.delayed(const Duration(seconds: 3));

    final products = await productService.fetch();
    return products.firstWhere((product) => product.id == id);
  }
}
