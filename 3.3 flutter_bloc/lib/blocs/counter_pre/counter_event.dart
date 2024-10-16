part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

final class IncrementCounterEvent extends CounterEvent {
  const IncrementCounterEvent();
}

final class DecrementCounterEvent extends CounterEvent {
  const DecrementCounterEvent();
}