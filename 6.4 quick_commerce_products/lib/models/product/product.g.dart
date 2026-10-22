// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toDouble(),
  description: json['description'] as String,
  image: json['image'] as String,
  quantity: (json['quantity'] as num).toInt(),
  rating: (json['rating'] as num).toDouble(),
  reviews: (json['reviews'] as num).toInt(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'price': instance.price,
  'description': instance.description,
  'image': instance.image,
  'quantity': instance.quantity,
  'rating': instance.rating,
  'reviews': instance.reviews,
};
