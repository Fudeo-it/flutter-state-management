import 'dart:async';

import 'package:airbnb_checkin/models/auth_status.dart';
import 'package:airbnb_checkin/models/user/user.dart';
import 'package:airbnb_checkin/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  late StreamSubscription _subscription;

  AuthCubit({
    required this.authRepository,
  }) : super(const CheckingAuthState()) {
    _subscription = authRepository.currentStatus.listen(
      (status) => switch (status) {
        AuthenticatedAuthStatus(:final user) => emit(
            AuthenticatedAuthState(user),
          ),
        NotAuthenticatedAuthStatus() => emit(
            const NotAuthenticatedAuthState(),
          ),
      },
      onError: (_) => emit(const NotAuthenticatedAuthState()),
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  void signOut() => authRepository.signOut();
}
