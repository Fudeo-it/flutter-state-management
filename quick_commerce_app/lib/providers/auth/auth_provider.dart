import 'dart:async';

import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_commerce_app/models/user/user.dart';
import 'package:quick_commerce_app/repositories/auth_repository.dart';

final authProvider = AsyncNotifierProvider.autoDispose<AuthNotifier, User?>(AuthNotifier.new);

final signInMutation = Mutation<User>();

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    final authRepository = ref.read(authRepositoryProvider);

    return authRepository.currentUser;
  }

  Future<User?> signIn({required String email, required String password}) async {
    try {
      final user = await signInMutation.run(ref, (tsx) async {
        final authRepository = tsx.get(authRepositoryProvider);

        return await authRepository.signIn(email, password);
      });

      state = AsyncData(user);

      return user;
    } catch (_) {}

    return null;
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);

    await authRepository.signOut();
    state = AsyncData(null);
  }
}