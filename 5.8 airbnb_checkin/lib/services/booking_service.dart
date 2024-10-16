import 'dart:convert';

import 'package:airbnb_checkin/models/booking/booking.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

class BookingService {
  const BookingService();

  Future<Booking?> search(String pinCode) async {
    final raw = await rootBundle.loadString('assets/bookings.json');
    final json = jsonDecode(raw);
    final bookings = (json as List)
        .map((item) => Booking.fromJson(item))
        .toList(growable: false);

    return bookings.firstWhereOrNull(
        (booking) => booking.pinCode == pinCode,
    );
  }
}