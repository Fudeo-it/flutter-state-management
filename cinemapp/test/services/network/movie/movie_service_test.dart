import 'package:cinemapp/services/network/responses/popular/popular_response.dart';
import 'package:data_fixture_dart/misc/fixture_tuple.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:cinemapp/services/network/movie/movie_service.dart';

import '../../../fixtures/responses/popular_response_fixture_factory.dart';

/// Test case for the class MovieService
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  late MovieService service;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);

    service = MovieService(dio);
  });

  group('testing popular endpoint', () {
    late FixtureTuple<PopularResponse> response;

    setUp(() {
      response = PopularResponseFixture.factory().makeSingleWithJsonObject();
    });

    test('when popular endpoint returns a PopularResponse', () async {
      dioAdapter.onGet(
        '/movie/popular',
        (server) => server.reply(
          200,
          response.json,
        ),
        queryParameters: {
          'page': 1,
          'language': 'en-US',
        },
      );

      final result = await service.popular();
      expect(result, response.object);
    });

    test('when popular endpoint returns 500 error', () {
      dioAdapter.onGet(
        '/movie/popular',
        (server) => server.reply(
          500,
          'Internal Server Error',
        ),
        queryParameters: {
          'page': 1,
          'language': 'en-US',
        },
      );

      expect(service.popular(), throwsException);
    });
  });
}