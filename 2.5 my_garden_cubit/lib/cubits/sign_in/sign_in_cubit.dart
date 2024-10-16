import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden/repositories/auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;

  SignInCubit({
    required this.authRepository,
  }) : super(const InitialSignInState());

  void signIn(String email, String password) async {
    emit(const PerformingSignInState());

    try {
      await authRepository.signIn(email, password);
      emit(const PerformedSignInState());
    } catch (_) {
      emit(const ErrorPerformingSignInState('Invalid credentials'));
    }
  }
}
