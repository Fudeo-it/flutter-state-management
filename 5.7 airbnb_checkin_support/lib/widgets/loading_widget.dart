import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final EdgeInsets padding;

  const LoadingWidget({
    super.key,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: padding,
          child: const CircularProgressIndicator(),
        ),
      );
}
