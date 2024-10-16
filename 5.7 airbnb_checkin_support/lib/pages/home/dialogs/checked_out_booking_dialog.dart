import 'package:flutter/material.dart';

class CheckedOutBookingDialog extends StatelessWidget {
  const CheckedOutBookingDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Yay!'),
    content: const Text('Hai eseguito il check-out correttamente!'),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).maybePop(),
        child: const Text('OK'),
      ),
    ],
  );
}
