import 'package:airbnb_checkin/models/user/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
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
          user.fullName,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
            fontSize: 22.0,
          ),
        ),
      );
}
