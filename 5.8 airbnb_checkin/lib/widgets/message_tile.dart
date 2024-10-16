import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String message;

  const MessageTile(this.message, {super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        leading: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Image.asset(
            'assets/images/avatar.png',
            width: 32.0,
            height: 32.0,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          message,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey.shade600,
          ),
        ),
      );
}
