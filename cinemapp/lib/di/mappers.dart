part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<DTOMapper<MovieJTO, Movie>>(
    create: (_) => const MovieMapper(),
  ),
];
