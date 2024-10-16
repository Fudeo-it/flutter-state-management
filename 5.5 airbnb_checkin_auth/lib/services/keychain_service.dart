import 'dart:convert';

import 'package:airbnb_checkin/models/user/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeychainService {
  static const _currentUser = 'currentUser';

  final FlutterSecureStorage secureStorage;

  const KeychainService({
    required this.secureStorage,
  });

  Future<User?> get user async {
    final raw = await secureStorage.read(key: _currentUser);
    if (raw == null) {
      return null;
    }

    return User.fromJson(jsonDecode(raw));
  }

  Future<void> saveUser(User user) async {
    final raw = jsonEncode(user.toJson());
    await secureStorage.write(key: _currentUser, value: raw);
  }

  Future<void> deleteUser() async {
    await secureStorage.delete(key: _currentUser);
  }
}
