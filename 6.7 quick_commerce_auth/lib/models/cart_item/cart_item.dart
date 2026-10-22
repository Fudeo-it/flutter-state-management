import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quick_commerce_app/models/product/product.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem extends Equatable {
  final Product product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  @override
  List<Object?> get props => [product, quantity];
}

extension CartItemExtensions on CartItem {
  MapEntry<Product, int> get toMapEntry => MapEntry(product, quantity);
}

extension MapEntryExtensions on MapEntry<Product, int> {
  CartItem get toCartItem => CartItem(product: key, quantity: value);
}