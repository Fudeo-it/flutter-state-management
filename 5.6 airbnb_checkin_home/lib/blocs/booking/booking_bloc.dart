import 'package:airbnb_checkin/models/booking/booking.dart';
import 'package:airbnb_checkin/repositories/booking_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_event.dart';

part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository bookingRepository;

  BookingBloc({
    required this.bookingRepository,
  }) : super(const InitialBookingState()) {
    on<CheckInBookingEvent>(_onCheckIn);
    on<CheckOutBookingEvent>(_onCheckOut);
  }

  void checkIn(String pinCode) => add(CheckInBookingEvent(pinCode));

  void checkOut(Booking booking) => add(CheckOutBookingEvent(booking));

  void _onCheckIn(
    CheckInBookingEvent event,
    Emitter<BookingState> emit,
  ) async {
    emit(const CheckingInBookingState());

    try {
      final booking = await bookingRepository.checkIn(event.pinCode);
      emit(CheckedInBookingState(booking));
    } catch (_) {
      emit(const ErrorCheckingInBookingState('Errore durante il check-in'));
    }
  }

  void _onCheckOut(
    CheckOutBookingEvent event,
    Emitter<BookingState> emit,
  ) async {
    emit(const CheckingOutBookingState());

    try {
      final booking = await bookingRepository.checkOut(event.booking);
      emit(CheckedOutBookingState(booking));
    } catch (_) {
      emit(const ErrorCheckingOutBookingState('Errore durante il check-out'));
    }
  }
}
