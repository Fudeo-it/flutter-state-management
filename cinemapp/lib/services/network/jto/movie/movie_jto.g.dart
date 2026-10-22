// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_jto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieJTOImpl _$$MovieJTOImplFromJson(Map<String, dynamic> json) =>
    _$MovieJTOImpl(
      (json['id'] as num).toInt(),
      poster: json['poster_path'] as String,
      title: json['title'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$$MovieJTOImplToJson(_$MovieJTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.poster,
      'title': instance.title,
      'overview': instance.overview,
    };
