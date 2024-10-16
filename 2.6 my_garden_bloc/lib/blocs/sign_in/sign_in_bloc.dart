import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden/repositories/auth_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;

  SignInBloc({
    required this.authRepository,
  }) : super(const InitialSignInState()) {
    on<PerformSignInEvent>(_onPerform);
  }

  void signIn(String email, String password) {
    add(PerformSignInEvent(email: email, password: password));
  }

  void _onPerform(PerformSignInEvent event, Emitter<SignInState> emit) async {
    emit(const PerformingSignInState());

    try {
      await authRepository.signIn(event.email, event.password);
      emit(const PerformedSignInState());
    } catch (error) {
      emit(const ErrorPerformingSignInState('Invalid credentials'));
    }
  }
}
