import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final GestureTapCallback? onPressed;

  const SignInButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => Container(
    height: 60.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
          blurRadius: 20,
          offset: const Offset(0, 10),
        )
      ]
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Row(
        spacing: 8.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Accedi'),
          const Icon(Icons.arrow_forward_rounded, size: 20.0),
        ],
      ),
    ),
  );
}
