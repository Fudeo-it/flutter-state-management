import 'package:flutter/material.dart';
import 'package:flutter_bloc/blocs/counter/counter_bloc.dart';
import 'package:flutter_bloc/builders/bloc_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc();

  void _incrementCounter() {
    _bloc.increment();
  }

  void _decrementCounter() {
    _bloc.decrement();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<CounterBloc, CounterState>(
                  bloc: _bloc,
                  builder: (context, state) {
                    final counter = state.value;

                    return Text(
                      counter.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    );
                  },
                ),
              ),
              FilledButton(
                onPressed: _incrementCounter,
                child: const Text('Increment'),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: _decrementCounter,
                child: const Text('Decrement'),
              ),
            ],
          ),
        ),
      );
}
