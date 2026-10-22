import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:my_garden/repositories/auth_repository.dart';

final signInMutation = Mutation<void>();

Future<void> signIn(
  MutationTarget ref, {
  required String email,
  required String password,
}) async {
  return signInMutation.run(ref, (tsx) async {
    final authRepository = tsx.get(authRepositoryProvider);

    await authRepository.signIn(email, password);
  });
}
