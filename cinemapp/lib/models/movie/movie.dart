import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const Movie._();

  const factory Movie(int id, {
    required String poster,
    required String title,
    required String overview,
  }) = _Movie;
}