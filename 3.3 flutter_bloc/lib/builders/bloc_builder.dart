import 'package:flutter/material.dart';
import 'package:flutter_bloc/blocs/bloc.dart';

class BlocBuilder<B extends Bloc, S> extends StatelessWidget {
  final B bloc;
  final Widget Function(BuildContext context, S state) builder;

  const BlocBuilder({
    super.key,
    required this.bloc,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          final state = snapshot.hasData ? snapshot.data! : bloc.state;

          return builder(context, state);
        },
      );
}
