import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  final GestureTapCallback? onPressed;

  const ForgotPasswordButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onPressed,
    child: const Text('Password dimenticata?'),
  );
}
