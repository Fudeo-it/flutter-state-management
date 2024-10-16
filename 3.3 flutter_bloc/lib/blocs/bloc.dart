import 'dart:async';

typedef StateEmitter<S> = void Function(S state);
typedef EventToStateMapper<E, S> = FutureOr<void> Function(
    E event,
    StateEmitter<S> emit,
    );

abstract class Bloc<E, S> {
  late S state;

  final _eventController = StreamController<E>();
  final _stateController = StreamController<S>();
  final _subscriptions = <Type, EventToStateMapper<E, S>>{};

  late StreamSubscription<E> _eventSubscription;

  Bloc(S initialState) {
    state = initialState;
    _stateController.add(state);

    _eventSubscription = _eventController.stream.listen(_mapEventToState);
  }

  Stream<S> get stream => _stateController.stream;

  void dispose() {
    _eventController.close();
    _stateController.close();
    _eventSubscription.cancel();
  }

  void _mapEventToState(E event) {
    final mapper = _subscriptions[event.runtimeType];

    if (mapper != null) {
      mapper(event, _emit);
    }
  }
  
  void on<Event extends E>(EventToStateMapper<E, S> mapper) {
    _subscriptions.putIfAbsent(Event, () => mapper);
  }

  void add(E event) {
    _eventController.add(event);
  }

  void _emit(S state) {
    this.state = state;
    _stateController.add(state);
  }
}