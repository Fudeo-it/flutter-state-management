import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PerformCheckInSection extends StatelessWidget {
  final TextEditingController pinController;
  final ValueChanged<String>? onCheckIn;

  const PerformCheckInSection({
    super.key,
    required this.pinController,
    this.onCheckIn,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 36.0),
            child: Text(
              'Inserisci il pin-code che dovresti aver ricevuto dall\'host per procedere con la procedura di check-in.',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14.0,
              ),
            ),
          ),
          Center(
            child: Pinput(
              length: 4,
              controller: pinController,
              defaultPinTheme: PinTheme(
                width: 64,
                height: 64,
                textStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 64,
                height: 64,
                textStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade900,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
              separatorBuilder: (_) => const SizedBox(width: 16.0),
              validator: (code) {
                return code?.length == 4 ? null : 'Inserisci un pincode valido';
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24.0),
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () => _performCheckIn(context),
              child: const Text('Check-in'),
            ),
          ),
        ],
      );

  void _performCheckIn(BuildContext context) {
    final pinCode = pinController.text;

    if (pinCode.length == 4) {
      onCheckIn?.call(pinCode);
    }
  }
}
