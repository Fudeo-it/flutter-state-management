part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<AuthService>(
    create: (_) => const AuthService(),
  ),
  Provider<BookingService>(
    create: (_) => const BookingService(),
  ),
  Provider<KeychainService>(
    create: (_) => const KeychainService(
      secureStorage: FlutterSecureStorage(),
    ),
  ),
];
