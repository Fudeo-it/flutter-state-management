import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quick_commerce_app/models/user/user.dart';

const _currentUser = 'currentUser0';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final keychainServiceProvider = Provider<KeychainService>((ref) {
  final secureStorage = ref.read(secureStorageProvider);

  return KeychainService(secureStorage: secureStorage);
});

class KeychainService {
  final FlutterSecureStorage secureStorage;

  const KeychainService({required this.secureStorage});

  Future<User?> get user async {
    final raw = await secureStorage.read(key: _currentUser);
    if (raw == null) {
      return null;
    }

    final json = jsonDecode(raw);
    return User.fromJson(json);
  }

  Future<void> saveUser(User user) async {
    final json = user.toJson();
    final raw = jsonEncode(json);

    await secureStorage.write(key: _currentUser, value: raw);
  }

  Future<void> deleteUser() async {
    await secureStorage.delete(key: _currentUser);
  }
}