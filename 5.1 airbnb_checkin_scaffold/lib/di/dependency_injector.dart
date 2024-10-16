import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:provider/single_child_widget.dart';

part 'blocs.dart';
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
        providers: _providers,
        repositories: _repositories,
        blocs: _blocs,
        child: child,
      );
}
