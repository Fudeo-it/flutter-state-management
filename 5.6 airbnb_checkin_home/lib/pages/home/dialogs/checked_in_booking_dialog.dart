import 'package:flutter/material.dart';

class CheckedInBookingDialog extends StatelessWidget {
  const CheckedInBookingDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Yay!'),
        content: const Text('Hai eseguito il check-in correttamente!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).maybePop(),
            child: const Text('OK'),
          ),
        ],
      );
}
