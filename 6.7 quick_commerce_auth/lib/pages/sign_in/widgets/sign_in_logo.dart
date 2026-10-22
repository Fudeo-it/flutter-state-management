import 'package:flutter/material.dart';

class SignInLogo extends StatelessWidget {
  const SignInLogo({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 96.0,
    width: 96.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.0),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Theme.of(context).primaryColor.withValues(alpha: 0.2),
          Theme.of(context).primaryColor.withValues(alpha: 0.05),
        ],
      ),
      border: Border.all(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Icon(
      Icons.local_mall_outlined,
      size: 40.0,
      color: Theme.of(context).primaryColor,
    ),
  );
}
