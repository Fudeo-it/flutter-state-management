import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:cinemapp/services/network/responses/popular/popular_response.dart';

import '../jto/movie_jto_fixture_factory.dart';

extension PopularResponseFixture on PopularResponse {
  static PopularResponseFixtureFactory factory() => PopularResponseFixtureFactory();
}

class PopularResponseFixtureFactory extends JsonFixtureFactory<PopularResponse> {
  @override
  FixtureDefinition<PopularResponse> definition() => define(
        (faker) => PopularResponse(
          MovieJTOFixture.factory().makeMany(3),
        ),
  );

  @override
  JsonFixtureDefinition<PopularResponse> jsonDefinition() => defineJson(
      (object) => {
        'results': object.results,
      },
  );
}
