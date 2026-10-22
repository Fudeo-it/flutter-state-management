import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:cinemapp/services/network/jto/movie/movie_jto.dart';

extension MovieJTOFixture on MovieJTO {
  static MovieJTOFixtureFactory factory() => MovieJTOFixtureFactory();
}

class MovieJTOFixtureFactory extends JsonFixtureFactory<MovieJTO> {
  @override
  FixtureDefinition<MovieJTO> definition() => define(
        (faker) => MovieJTO(
          faker.randomGenerator.integer(100),
          poster: faker.internet.httpsUrl(),
          title: faker.lorem.word(),
          overview: faker.lorem.word(),
        ),
  );

  @override
  JsonFixtureDefinition<MovieJTO> jsonDefinition() => defineJson(
      (object) => {
        'id': object.id,
        'poster_path': object.poster,
        'title': object.title,
        'overview': object.overview,
      },
  );
}
