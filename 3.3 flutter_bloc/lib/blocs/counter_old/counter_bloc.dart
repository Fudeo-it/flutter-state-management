import 'dart:async';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc {
  late CounterState state;

  final _eventController = StreamController<CounterEvent>();
  final _stateController = StreamController<CounterState>();

  late StreamSubscription<CounterEvent> _eventSubscription;

  CounterBloc(CounterState initialState) {
    state = initialState;
    _stateController.add(state);

    _eventSubscription = _eventController.stream.listen(_mapEventToState);
  }

  Stream<CounterState> get stream => _stateController.stream;

  void increment() {
    _eventController.add(const IncrementCounterEvent());
  }

  void decrement() {
    _eventController.add(const DecrementCounterEvent());
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
    _eventSubscription.cancel();
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementCounterEvent) {
      final newValue = state.value + 1;
      final newState = CounterState(newValue);

      _stateController.add(newState);
      state = newState;
    } else if (event is DecrementCounterEvent) {
      final newValue = state.value - 1;
      final newState = CounterState(newValue);

      _stateController.add(newState);
      state = newState;

    }
  }
}