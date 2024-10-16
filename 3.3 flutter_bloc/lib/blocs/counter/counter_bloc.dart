import 'package:flutter_bloc/blocs/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementCounterEvent>(_onIncrement);
    on<DecrementCounterEvent>(_onDecrement);
  }

  void increment() => add(const IncrementCounterEvent());

  void decrement() => add(const DecrementCounterEvent());

  void _onIncrement(CounterEvent event, StateEmitter<CounterState> emit) {
    final newValue = state.value + 1;
    emit(CounterState(newValue));
  }

  void _onDecrement(CounterEvent event, StateEmitter<CounterState> emit) {
    final newValue = state.value - 1;
    emit(CounterState(newValue));
  }
}