import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:cinemapp/models/movie/movie.dart';

extension MovieFixture on Movie {
  static MovieFixtureFactory factory() => MovieFixtureFactory();
}

class MovieFixtureFactory extends FixtureFactory<Movie> {
  @override
  FixtureDefinition<Movie> definition() => define(
        (faker) => Movie(
          faker.randomGenerator.integer(100),
          poster: faker.lorem.word(),
          title: faker.lorem.word(),
          overview: faker.lorem.word(),
        ),
  );
}
