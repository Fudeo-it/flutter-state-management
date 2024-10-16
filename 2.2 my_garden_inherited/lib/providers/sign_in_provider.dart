import 'package:flutter/material.dart';
import 'package:my_garden/repositories/auth_repository.dart';

class SignInProvider extends StatefulWidget {
  final AuthRepository authRepository;
  final Widget child;

  const SignInProvider({
    super.key,
    required this.authRepository,
    required this.child,
  });

  @override
  State<SignInProvider> createState() => _SignInProviderState();
}

class _SignInProviderState extends State<SignInProvider> {
  bool _loading = false;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return SignInInherited(
      authRepository: widget.authRepository,
      loading: _loading,
      errorText: _errorText,
      onLoading: _onLoading,
      onSuccess: _onSuccess,
      onError: _onError,
      child: widget.child,
    );
  }

  void _onLoading() {
    setState(() {
      _loading = true;
      _errorText = null;
    });
  }

  void _onSuccess() {
    setState(() {
      _loading = false;
    });
  }

  void _onError() {
    setState(() {
      _loading = false;
      _errorText = 'Invalid credentials';
    });
  }
}

class SignInInherited extends InheritedWidget {
  final AuthRepository authRepository;
  final VoidCallback? onLoading;
  final VoidCallback? onSuccess;
  final VoidCallback? onError;

  final bool loading;
  final String? errorText;

  const SignInInherited({
    super.key,
    required this.authRepository,
    required super.child,
    this.loading = false,
    this.errorText,
    this.onLoading,
    this.onSuccess,
    this.onError,
  });

  static SignInInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SignInInherited>();
  }

  void signIn(String email, String password) async {
    onLoading?.call();

    try {
      await authRepository.signIn(email, password);
      onSuccess?.call();
    } catch (error) {
      onError?.call();
    }
  }

  @override
  bool updateShouldNotify(SignInInherited oldWidget) {
    return oldWidget.loading != loading || oldWidget.errorText != errorText;
  }
}
