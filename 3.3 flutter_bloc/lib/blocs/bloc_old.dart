import 'dart:async';

abstract class Bloc<E, S> {
  late S state;

  final _eventController = StreamController<E>();
  final _stateController = StreamController<S>();

  late StreamSubscription<E> _eventSubscription;

  Bloc(S initialState) {
    state = initialState;
    _stateController.add(state);

    _eventSubscription = _eventController.stream.listen(mapEventToState);
  }

  Stream<S> get stream => _stateController.stream;

  void dispose() {
    _eventController.close();
    _stateController.close();
    _eventSubscription.cancel();
  }

  void mapEventToState(E event);

  void add(E event) {
    _eventController.add(event);
  }

  void emit(S state) {
    this.state = state;
    _stateController.add(state);
  }
}