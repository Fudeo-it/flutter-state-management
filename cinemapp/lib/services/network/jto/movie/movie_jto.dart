import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_jto.g.dart';

part 'movie_jto.freezed.dart';

@freezed
class MovieJTO extends DTO with _$MovieJTO {
  const factory MovieJTO(int id, {
    @JsonKey(name: 'poster_path') required String poster,
    required String title,
    required String overview,
  }) = _MovieJTO;

  factory MovieJTO.fromJson(Map<String, dynamic> json) =>
    _$MovieJTOFromJson(json);
}
