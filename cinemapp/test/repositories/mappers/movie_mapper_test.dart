import 'package:flutter_test/flutter_test.dart';
import 'package:cinemapp/models/movie/movie.dart';
import 'package:cinemapp/repositories/mappers/movie_mapper.dart';
import 'package:cinemapp/services/network/jto/movie/movie_jto.dart';
import '../../fixtures/jto/movie_jto_fixture_factory.dart';

void main() {
  late MovieMapper mapper;
  late MovieJTO dto;
  late Movie model;

  setUp(() {
    dto = MovieJTOFixture.factory().makeSingle();

    model = Movie(
      dto.id,
      poster: dto.poster,
      title: dto.title,
      overview: dto.overview,
    );
    mapper = const MovieMapper();
  });

  test('mapping Movie object from MovieJTO', () {
    expect(mapper.fromDTO(dto), equals(model));
  });

  test('mapping Movie to MovieJTO', () {
    expect(mapper.toDTO(model), equals(dto));
  });
}
