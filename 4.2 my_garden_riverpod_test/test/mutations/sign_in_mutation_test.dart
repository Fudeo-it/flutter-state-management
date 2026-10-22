import 'package:faker/faker.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_garden/mutations/sign_in_mutation.dart';
import 'package:my_garden/repositories/auth_repository.dart';

import 'sign_in_mutation_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late ProviderContainer container;
  late MockAuthRepository authRepository;

  late List<MutationState<void>> states;
  late ProviderSubscription<MutationState<void>> subscription;

  late String email;
  late String password;

  setUp(() {
    authRepository = MockAuthRepository();

    container = ProviderContainer.test(
      overrides: [authRepositoryProvider.overrideWith((ref) => authRepository)],
    );

    states = [];

    email = faker.internet.email();
    password = faker.internet.password();

    subscription =
        container.listen(signInMutation, (_, next) => states.add(next));
  });

  tearDown(() {
    states.clear();

    subscription.close();
    container.dispose();
  });

  test('testing successful signIn', () async {
    when(authRepository.signIn(email, password)).thenAnswer((_) async {});

    await signIn(container, email: email, password: password);
    expect(states, [isA<MutationPending>(), isA<MutationSuccess>()]);

    verify(authRepository.signIn(email, password)).called(1);
  });

  test('testing signIn with error', () async {
    when(authRepository.signIn(email, password)).thenThrow(Error());

    try {
      await signIn(container, email: email, password: password);
    } catch (_) {}
    expect(states, [isA<MutationPending>(), isA<MutationError>()]);

    verify(authRepository.signIn(email, password));
  });
}
