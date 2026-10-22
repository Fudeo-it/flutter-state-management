import 'package:flutter/material.dart';

class DotSeparator extends StatelessWidget {
  const DotSeparator({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    width: 4.0,
    height: 4.0,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
  );
}
