import 'package:cinemapp/services/network/responses/popular/popular_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'movie_service.g.dart';

/// Abstract class of MovieService
@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET('/movie/popular')
  Future<PopularResponse> popular({
    @Query('page') int page = 1,
    @Query('language') String language = 'en-US',
  });
}

extension MovieServiceExtension on BuildContext {
  /// Extension method used to get the [MovieService] instance
  MovieService get movieService => read<MovieService>();
}