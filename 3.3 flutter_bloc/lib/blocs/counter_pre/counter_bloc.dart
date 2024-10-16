import 'package:flutter_bloc/blocs/bloc_old.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState(0));

  @override
  void mapEventToState(CounterEvent event) {
    if (event is IncrementCounterEvent) {
      final newValue = state.value + 1;
      emit(CounterState(newValue));
    } else if (event is DecrementCounterEvent) {
      final newValue = state.value - 1;
      emit(CounterState(newValue));
    }
  }

  void increment() => add(const IncrementCounterEvent());

  void decrement() => add(const DecrementCounterEvent());

}