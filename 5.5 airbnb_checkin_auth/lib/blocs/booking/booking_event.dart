part of 'booking_bloc.dart';

sealed class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object?> get props => [];
}

final class CheckInBookingEvent extends BookingEvent {
  final String pinCode;

  const CheckInBookingEvent(this.pinCode);

  @override
  List<Object?> get props => [pinCode];
}

final class CheckOutBookingEvent extends BookingEvent {
  final Booking booking;

  const CheckOutBookingEvent(this.booking);

  @override
  List<Object?> get props => [booking];
}
