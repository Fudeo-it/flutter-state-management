part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<MovieRepository>(
    create: (context) => MovieRepositoryImpl(
      movieService: context.read(),
      movieMapper: context.read(),
    ),
  ),
];
