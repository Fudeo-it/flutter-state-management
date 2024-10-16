import 'package:flutter/material.dart';
import 'package:my_garden/repositories/auth_repository.dart';

class SignInNotifier extends ChangeNotifier {
  final AuthRepository authRepository;

  bool _loading = false;
  bool _success = false;
  String? _errorText;

  SignInNotifier({
    required this.authRepository,
  });

  bool get loading => _loading;

  bool get success => _success;

  String? get errorText => _errorText;

  void signIn(String email, String password) async {
    _loading = true;
    _success = false;
    _errorText = null;
    notifyListeners();

    try {
      await authRepository.signIn(email, password);
      _success = true;
    } catch (error) {
      _errorText = 'Invalid credentials';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
