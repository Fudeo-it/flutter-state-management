import 'package:cinemapp/models/movie/movie.dart';
import 'package:cinemapp/repositories/mappers/movie_mapper.dart';
import 'package:cinemapp/services/network/movie/movie_service.dart';
import 'package:cinemapp/services/network/responses/popular/popular_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinemapp/repositories/movie_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/responses/popular_response_fixture_factory.dart';
import 'movie_repository_test.mocks.dart';

/// Test case for the class MovieRepositoryImpl
@GenerateMocks([
  MovieService,
  MovieMapper,
])
void main() {
  late MockMovieService service;
  late MockMovieMapper mapper;

  late MovieRepository repository;

  setUp(() {
    service = MockMovieService();
    mapper = MockMovieMapper();

    repository = MovieRepositoryImpl(
      movieService: service,
      movieMapper: mapper,
    );
  });

  /// Testing the method [popular]
  group('when the method popular is called', () {
    late PopularResponse response;
    late List<Movie> movies;

    setUp(() {
      response = PopularResponseFixture.factory().makeSingle();
      movies = response.results
          .map((movie) => Movie(
                movie.id,
                title: movie.title,
                overview: movie.overview,
                poster: movie.poster,
              ))
          .toList();
    });

    test('test that popular returns a list of movies',  () async {
      when(service.popular()).thenAnswer((_) async => response);

      for (var i = 0; i < response.results.length; i++) {
        when(mapper.fromDTO(response.results[i])).thenReturn(movies[i]);
      }

      final result = await repository.popular;
      expect(result, movies);

      verify(service.popular()).called(1);
      for (var i = 0; i < response.results.length; i++) {
        verify(mapper.fromDTO(response.results[i])).called(1);
      }
    });

    test('test that popular throws an exception', () async {
      when(service.popular()).thenThrow(Exception());

      try {
        await repository.popular;
        fail('Exception not thrown');
      } catch (e) {
        expect(e, isA<Exception>());
      }

      verify(service.popular()).called(1);
      verifyNever(mapper.fromDTO(any));
    });

    test('test that movieMapper throws an exception', () async {
      when(service.popular()).thenAnswer((_) async => response);
      when(mapper.fromDTO(any)).thenThrow(Exception());

      try {
        await repository.popular;
        fail('Exception not thrown');
      } catch (e) {
        expect(e, isA<Exception>());
      }

      verify(service.popular()).called(1);
      verify(mapper.fromDTO(any)).called(1);
    });
  });
}
