import 'dart:convert';

import 'package:airbnb_checkin/models/user/user.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

class AuthService {
  const AuthService();

  Future<User?> search(String email, String password) async {
    final raw = await rootBundle.loadString('assets/users.json');
    final json = jsonDecode(raw);
    final users = (json as List)
        .map((item) => User.fromJson(item))
        .toList(growable: false);

    return users.firstWhereOrNull(
        (user) => user.email == email && user.password == password,
    );
  }
}