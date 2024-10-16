import 'package:airbnb_checkin/blocs/sign_in/sign_in_bloc.dart';
import 'package:airbnb_checkin/cubits/auth/auth_cubit.dart';
import 'package:airbnb_checkin/widgets/custom_body.dart';
import 'package:airbnb_checkin/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SignInBloc(
          authRepository: context.read(),
        ),
        child: BlocSelector<AuthCubit, AuthState, bool>(
          selector: (state) => switch (state) {
            AuthenticatedAuthState() => true,
            _ => false,
          },
          builder: (context, canPop) {
            return PopScope(
              canPop: canPop,
              child: Scaffold(
                body: CustomBody(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        final loading = state is PerformingSignInState;
                        final errorText = state is ErrorPerformingSignInState
                            ? state.error
                            : null;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              width: 56.0,
                              height: 56.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                'Benvenuto in',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade500,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Airbnb check-in',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade900,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                'Da quest\'app puoi gestire il check-in e la tua permanenza negli Airbnb che hai prenotato.',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 48.0,
                              ),
                              child: Text(
                                'Accedi al tuo account Airbnb per continuare.',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    child: TextField(
                                      enabled: !loading,
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: 'Il tuo indirizzo email',
                                        label: const Text('Email'),
                                        errorText: errorText,
                                      ),
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    child: TextField(
                                      enabled: !loading,
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: 'La tua password',
                                        label: Text('Password'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 24.0),
                              width: double.maxFinite,
                              child: switch (state) {
                                PerformingSignInState() =>
                                  const LoadingWidget(),
                                _ => ElevatedButton(
                                    onPressed: () => _signIn(context),
                                    child: const Text('Accedi'),
                                  ),
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _signIn(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    context.read<SignInBloc>().signIn(email, password);
  }
}
