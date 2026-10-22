// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PopularResponseImpl _$$PopularResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularResponseImpl(
      (json['results'] as List<dynamic>)
          .map((e) => MovieJTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PopularResponseImplToJson(
        _$PopularResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
