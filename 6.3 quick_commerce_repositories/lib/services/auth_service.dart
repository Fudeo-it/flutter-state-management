import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_commerce_app/models/user/user.dart';

final authServiceProvider = Provider<AuthService>((ref) => const AuthService());

class AuthService {
  const AuthService();

  Future<User?> search(String email, String password) async {
    final raw = await rootBundle.loadString('assets/users.json');
    final json = jsonDecode(raw);
    final users = (json as List)
        .map((user) => User.fromJson(user))
        .toList(growable: false);

    return users.firstWhereOrNull(
      (user) => user.email == email && user.password == password,
    );
  }
}
