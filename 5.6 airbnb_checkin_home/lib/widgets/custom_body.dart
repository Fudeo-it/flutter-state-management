import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  final Widget child;

  const CustomBody({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/images/illustration.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 176.0),
            child: child,
          ),
        ],
      );
}
