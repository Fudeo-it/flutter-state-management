import 'package:airbnb_checkin/models/booking/booking.dart';
import 'package:flutter/material.dart';

class PerformCheckOutSection extends StatelessWidget {
  final Booking booking;
  final GestureTapCallback? onTapCheckout;
  final GestureTapCallback? onTapSupport;

  const PerformCheckOutSection(
    this.booking, {
    super.key,
    this.onTapCheckout,
    this.onTapSupport,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900,
                        fontSize: 16.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2.0,
                        bottom: 16.0,
                      ),
                      child: Text(
                        '${booking.guestsCount} ospiti',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      child: Image.asset(
                        booking.assetPath,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24.0),
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: onTapCheckout,
              child: const Text('Check-out'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            width: double.maxFinite,
            child: OutlinedButton(
              onPressed: onTapSupport,
              child: const Text('Chat'),
            ),
          ),
        ],
      );
}
