import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String image;
  final int quantity;
  final double rating;
  final int reviews;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.quantity,
    required this.rating,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    price,
    description,
    image,
    quantity,
    rating,
    reviews,
  ];
}
