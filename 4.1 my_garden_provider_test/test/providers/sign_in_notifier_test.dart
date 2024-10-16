import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_garden/providers/sign_in_notifier.dart';
import 'package:my_garden/repositories/auth_repository.dart';

import '../change_notifier_tester.dart';
import 'sign_in_notifier_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository authRepository;
  late SignInNotifier notifier;

  late ChangeNotifierTester<SignInNotifier> tester;

  late String email;
  late String password;

  setUp(() {
    authRepository = MockAuthRepository();
    notifier = SignInNotifier(authRepository: authRepository);
    tester = ChangeNotifierTester(notifier);

    email = faker.internet.email();
    password = faker.internet.password();
  });

  tearDown(() {
    tester.destroy();
  });

  test('testing successful signIn', () async {
    when(authRepository.signIn(email, password)).thenAnswer((_) async {});

    expect(notifier.loading, isFalse);
    expect(notifier.success, isFalse);
    expect(notifier.errorText, isNull);

    notifier.signIn(email, password);

    await tester.wait();
    expect(notifier.loading, isTrue);
    expect(notifier.success, isFalse);
    expect(notifier.errorText, isNull);

    await tester.wait();
    expect(notifier.loading, isFalse);
    expect(notifier.success, isTrue);
    expect(notifier.errorText, isNull);

    verify(authRepository.signIn(email, password)).called(1);
  });

  test('testing signIn with error', () async {
    when(authRepository.signIn(email, password))
        .thenAnswer((_) async => throw Error());

    expect(notifier.loading, isFalse);
    expect(notifier.success, isFalse);
    expect(notifier.errorText, isNull);

    notifier.signIn(email, password);

    await tester.wait();
    expect(notifier.loading, isTrue);
    expect(notifier.success, isFalse);
    expect(notifier.errorText, isNull);

    await tester.wait();
    expect(notifier.loading, isFalse);
    expect(notifier.success, isFalse);
    expect(notifier.errorText, 'Invalid credentials');

    verify(authRepository.signIn(email, password)).called(1);
  });
}
