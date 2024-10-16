
import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_garden/blocs/sign_in/sign_in_bloc.dart';
import 'package:my_garden/repositories/auth_repository.dart';

import 'sign_in_bloc_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late AuthRepository authRepository;

  late String email;
  late String password;

  setUp(() {
    authRepository = MockAuthRepository();

    email = faker.internet.email();
    password = faker.internet.password();
  });

  blocTest<SignInBloc, SignInState>(
    'testing successful signIn',
    setUp: () {
      when(authRepository.signIn(email, password)).thenAnswer((_) async {});
    },
    build: () => SignInBloc(authRepository: authRepository),
    act: (bloc) => bloc.signIn(email, password),
    seed: () => const InitialSignInState(),
    expect: () => const [
      PerformingSignInState(),
      PerformedSignInState(),
    ],
    verify: (_) {
      verify(authRepository.signIn(email, password)).called(1);
    }
  );

  blocTest<SignInBloc, SignInState>(
    'testing signIn with error',
    setUp: () {
      when(authRepository.signIn(email, password)).thenThrow(Error());
    },
    build: () => SignInBloc(authRepository: authRepository),
    act: (bloc) => bloc.signIn(email, password),
    seed: () => const InitialSignInState(),
    expect: () => const [
      PerformingSignInState(),
      ErrorPerformingSignInState('Invalid credentials'),
    ],
    verify: (_) {
      verify(authRepository.signIn(email, password)).called(1);
    }
  );
}