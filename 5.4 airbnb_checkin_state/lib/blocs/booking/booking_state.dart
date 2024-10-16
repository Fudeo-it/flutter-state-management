part of 'booking_bloc.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object?> get props => [];
}

final class InitialBookingState extends BookingState {
  const InitialBookingState();
}

final class CheckingInBookingState extends BookingState {
  const CheckingInBookingState();
}

final class CheckedInBookingState extends BookingState {
  final Booking booking;

  const CheckedInBookingState(this.booking);

  @override
  List<Object?> get props => [booking];
}

final class ErrorCheckingInBookingState extends BookingState {
  final String error;

  const ErrorCheckingInBookingState(this.error);

  @override
  List<Object?> get props => [error];
}

final class CheckingOutBookingState extends BookingState {
  const CheckingOutBookingState();
}

final class CheckedOutBookingState extends BookingState {
  final Booking booking;

  const CheckedOutBookingState(this.booking);

  @override
  List<Object?> get props => [booking];
}

final class ErrorCheckingOutBookingState extends BookingState {
  final String error;

  const ErrorCheckingOutBookingState(this.error);

  @override
  List<Object?> get props => [error];
}
