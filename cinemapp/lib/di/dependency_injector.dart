import 'package:cinemapp/misc/constants.dart';
import 'package:cinemapp/models/movie/movie.dart';
import 'package:cinemapp/repositories/mappers/movie_mapper.dart';
import 'package:cinemapp/repositories/movie_repository.dart';
import 'package:cinemapp/services/network/jto/movie/movie_jto.dart';
import 'package:cinemapp/services/network/movie/movie_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pine/pine.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'blocs.dart';

part 'mappers.dart';

part 'providers.dart';

part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        blocs: _blocs,
        mappers: _mappers,
        providers: _providers,
        repositories: _repositories,
        child: child,
      );
}
