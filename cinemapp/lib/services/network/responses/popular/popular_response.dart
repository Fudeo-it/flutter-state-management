import 'package:cinemapp/services/network/jto/movie/movie_jto.dart';
import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_response.g.dart';

part 'popular_response.freezed.dart';

@freezed
class PopularResponse extends DTO with _$PopularResponse {
  const factory PopularResponse(List<MovieJTO> results) = _PopularResponse;

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularResponseFromJson(json);
}
