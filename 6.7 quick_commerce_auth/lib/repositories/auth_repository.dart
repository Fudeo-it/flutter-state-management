import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_commerce_app/models/user/user.dart';
import 'package:quick_commerce_app/services/auth_service.dart';
import 'package:quick_commerce_app/services/keychain_service.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.read(authServiceProvider);
  final keychainService = ref.read(keychainServiceProvider);

  return AuthRepository(authService: authService, keychainService: keychainService);
});

class AuthRepository {
  final AuthService authService;
  final KeychainService keychainService;

  const AuthRepository({
    required this.authService,
    required this.keychainService,
  });

  Future<User?> get currentUser async {
    try {
      return await keychainService.user;
    } catch (_) {

    }

    return null;
  }

  Future<User> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));

    final user = await authService.search(email, password);
    if (user != null) {
      await keychainService.saveUser(user);

      return user;
    }

    throw Exception('Credenziali non valide');
  }

  Future<void> signOut() async {
    await keychainService.deleteUser();
  }
}
