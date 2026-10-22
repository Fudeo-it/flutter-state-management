import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

class AuthRepository {
  static const _validEmail = 'email@example.it';
  static const _validPassword = 'password';

  Future<void> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));

    if (email == _validEmail && password == _validPassword) {
      return;
    } else {
      throw Exception('Invalid credentials');
    }
  }
}
