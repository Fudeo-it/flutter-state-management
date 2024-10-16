import 'dart:async';

import 'package:airbnb_checkin/models/auth_status.dart';
import 'package:airbnb_checkin/models/user/user.dart';
import 'package:airbnb_checkin/services/auth_service.dart';
import 'package:airbnb_checkin/services/keychain_service.dart';

class AuthRepository {
  final AuthService authService;
  final KeychainService keychainService;
  final StreamController<AuthStatus> _controller = StreamController();

  AuthRepository({
    required this.authService,
    required this.keychainService,
  });

  Stream<AuthStatus> get currentStatus async* {
    User? user;

    try {
      user = await keychainService.user;
    } catch(_) {}

    if (user != null) {
      yield AuthenticatedAuthStatus(user);
    } else {
      yield const NotAuthenticatedAuthStatus();
    }

    yield* _controller.stream.asBroadcastStream().distinct();
  }

  Future<void> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));

    final user = await authService.search(email, password);

    if (user != null) {
      await keychainService.saveUser(user);

      _controller.add(AuthenticatedAuthStatus(user));
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> signOut() async {
    await keychainService.deleteUser();

    _controller.add(const NotAuthenticatedAuthStatus());
  }
}
