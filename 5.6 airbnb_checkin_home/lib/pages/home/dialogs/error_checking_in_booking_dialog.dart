import 'package:flutter/material.dart';

class ErrorCheckingInBookingDialog extends StatelessWidget {
  const ErrorCheckingInBookingDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Oops!'),
    content: const Text('Si è verificato un errore durante la procedura di check-in.'),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).maybePop(),
        child: const Text('OK'),
      ),
    ],
  );
}
