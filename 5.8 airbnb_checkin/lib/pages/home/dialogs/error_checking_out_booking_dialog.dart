import 'package:flutter/material.dart';

class ErrorCheckingOutBookingDialog extends StatelessWidget {
  const ErrorCheckingOutBookingDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Oops!'),
    content: const Text('Si è verificato un errore durante la procedura di check-out.'),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).maybePop(),
        child: const Text('OK'),
      ),
    ],
  );
}
