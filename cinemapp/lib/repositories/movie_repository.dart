import 'package:cinemapp/models/movie/movie.dart';
import 'package:cinemapp/services/network/jto/movie/movie_jto.dart';
import 'package:cinemapp/services/network/movie/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:pine/pine.dart';
import 'package:provider/provider.dart';

/// Abstract class of MovieRepository
abstract class MovieRepository {
  Future<List<Movie>> get popular;
}

/// Implementation of the base interface MovieRepository
class MovieRepositoryImpl implements MovieRepository {
  final MovieService movieService;
  final DTOMapper<MovieJTO, Movie> movieMapper;

  const MovieRepositoryImpl({
    required this.movieService,
    required this.movieMapper,
  });

  @override
  Future<List<Movie>> get popular async {
    try {
      final response = await movieService.popular();

      return response.results.map(movieMapper.fromDTO).toList();
    } catch (_) {
      throw Exception('Error fetching popular movies');
    }
  }
}

extension MovieRepositoryExtension on BuildContext {
  /// Extension method used to get the [MovieRepository] instance
  MovieRepository get movieRepository => read<MovieRepository>();
}
