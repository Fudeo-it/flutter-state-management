import 'package:flutter/material.dart';

class ContinueAsGuestButton extends StatelessWidget {
  final GestureTapCallback? onPressed;

  const ContinueAsGuestButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onPressed,
    child: const Text('Continua come ospite'),
  );
}
