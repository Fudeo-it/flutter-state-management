part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<AuthRepository>(
    create: (context) => AuthRepository(
      authService: context.read(),
      keychainService: context.read(),
    ),
  ),
  RepositoryProvider<BookingRepository>(
    create: (context) => BookingRepository(
      bookingService: context.read(),
    ),
  ),
];
