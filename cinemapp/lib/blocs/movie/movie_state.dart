part of 'movie_bloc.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState.initial() = InitialMovieState;

  const factory MovieState.fetching() = FetchingMovieState;

  const factory MovieState.fetched(List<Movie> movies) = FetchedMovieState;

  const factory MovieState.none() = NoneMovieState;

  const factory MovieState.errorFetching() = ErrorFetchingMovieState;
}
