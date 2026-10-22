import 'package:cinemapp/models/movie/movie.dart';
import 'package:cinemapp/repositories/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';
import 'package:flutter/material.dart';

part 'movie_event.dart';

part 'movie_state.dart';

part 'movie_bloc.freezed.dart';

/// The MovieBloc
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  /// Create a new instance of [MovieBloc].
  MovieBloc({
    required this.movieRepository,
  }) : super(const MovieState.initial()) {
    on<FetchMovieEvent>(_onFetch);
  }

  /// Method used to add the [FetchMovieEvent] event
  void fetch() => add(const MovieEvent.fetch());

  FutureOr<void> _onFetch(
    FetchMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(const MovieState.fetching());
    try {
      final movies = await movieRepository.popular;
      emit(movies.isNotEmpty
          ? MovieState.fetched(movies)
          : const MovieState.none());
    } catch (_) {
      emit(const MovieState.errorFetching());
    }
  }
}

extension MovieBlocExtension on BuildContext {
  /// Extension method used to get the [MovieBloc] instance
  MovieBloc get movieBloc => read<MovieBloc>();
}
