import 'package:pine/pine.dart';
import 'package:cinemapp/models/movie/movie.dart';
import 'package:cinemapp/services/network/jto/movie/movie_jto.dart';

class MovieMapper extends DTOMapper<MovieJTO, Movie> {
  const MovieMapper();

  @override
  Movie fromDTO(MovieJTO dto) => Movie(
        dto.id,
        poster: dto.poster,
        title: dto.title,
        overview: dto.overview,
      );

  @override
  MovieJTO toDTO(Movie model) => MovieJTO(
        model.id,
        poster: model.poster,
        title: model.title,
        overview: model.overview,
      );
}
