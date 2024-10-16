import 'package:airbnb_checkin/models/booking/booking.dart';
import 'package:airbnb_checkin/services/booking_service.dart';

class BookingRepository {
  final BookingService bookingService;

  const BookingRepository({
    required this.bookingService,
  });

  Future<Booking> checkIn(String pinCode) async {
    await Future.delayed(const Duration(seconds: 3));

    final booking = await bookingService.search(pinCode);

    if (booking == null) {
      throw Exception('Booking not found');
    }

    final updatedBooking = booking.copyWith(
      checkInTime: DateTime.now(),
    );

    return updatedBooking;
  }

  Future<Booking> checkOut(Booking booking) async {
    await Future.delayed(const Duration(seconds: 3));

    final updatedBooking = booking.copyWith(
      checkOutTime: DateTime.now(),
    );

    return updatedBooking;
  }
}
