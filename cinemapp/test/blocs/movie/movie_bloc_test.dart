import 'package:bloc_test/bloc_test.dart';
import 'package:cinemapp/models/movie/movie.dart';
import 'package:cinemapp/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cinemapp/blocs/movie/movie_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/models/movie_fixture_factory.dart';
import 'movie_bloc_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository repository;
  late MovieBloc bloc;

  setUp(() {
    repository = MockMovieRepository();
    bloc = MovieBloc(
      movieRepository: repository,
    );
  });

  /// Testing the event [FetchMovieEvent]
  group('when the event FetchMovieEvent is added to the BLoC', () {
    late List<Movie> movies;

    setUp(() {
      movies = MovieFixture.factory().makeMany(3);
    });

    blocTest<MovieBloc, MovieState>(
      'test that MovieBloc emits MovieState.fetched when fetch is called',
      setUp: () {
        when(repository.popular).thenAnswer((_) async => movies);
      },
      build: () => bloc,
      act: (bloc) {
        bloc.fetch();
      },
      expect: () => <MovieState>[
        const MovieState.fetching(),
        MovieState.fetched(movies),
      ],
      verify: (_) {
        verify(repository.popular).called(1);
      },
    );

    blocTest<MovieBloc, MovieState>(
      'test that MovieBloc emits MovieState.none when fetch is called',
      setUp: () {
        when(repository.popular).thenAnswer((_) async => []);
      },
      build: () => bloc,
      act: (bloc) {
        bloc.fetch();
      },
      expect: () => <MovieState>[
        const MovieState.fetching(),
        const MovieState.none(),
      ],
      verify: (_) {
        verify(repository.popular).called(1);
      },
    );

    blocTest<MovieBloc, MovieState>(
      'test that MovieBloc emits MovieState.errorFetching when fetch is called',
      setUp: () {
        when(repository.popular)
            .thenThrow(Exception('Error fetching popular movies'));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.fetch();
      },
      expect: () => <MovieState>[
        const MovieState.fetching(),
        const MovieState.errorFetching(),
      ],
      verify: (_) {
        verify(repository.popular).called(1);
      },
    );
  });
}
