part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<Dio>(
    create: (_) => Dio(
      BaseOptions(
        connectTimeout: K.timeoutConnection,
        sendTimeout: K.timeoutConnection,
        receiveTimeout: K.timeoutConnection,
        contentType: Headers.jsonContentType,
        headers: {
          Headers.acceptHeader: Headers.jsonContentType,
          'Authorization': 'Bearer ${K.apiKey}',
        },
      ),
    ),
  ),
  Provider<MovieService>(
    create: (context) => MovieService(
      context.read(),
      baseUrl: K.baseUrl,
    ),
  ),
];
