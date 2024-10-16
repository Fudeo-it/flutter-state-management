import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_garden/blocs/sign_in/sign_in_bloc.dart';
import 'package:my_garden/pages/main_page.dart';

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
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) => switch (state) {
                PerformedSignInState() => _navigateToMainPage(context),
                _ => null,
              },
              builder: (context, state) {
                final loading = state is PerformingSignInState;
                final errorText =
                    state is ErrorPerformingSignInState ? state.error : null;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'my',
                      style: GoogleFonts.tinos(
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 64.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      'garden',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 64.0,
                      ),
                    ),
                    Image.asset('assets/images/background.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 4.0),
                      child: Text(
                        'Grow your seeds',
                        style: GoogleFonts.roboto(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'to ',
                              style: GoogleFonts.roboto(
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                            const TextSpan(
                                text: 'feed your home',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                )),
                          ],
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: TextField(
                        enabled: !loading,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          label: const Text('Email'),
                          prefixIcon: const Icon(Icons.email_outlined),
                          errorText: errorText,
                        ),
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: TextField(
                        enabled: !loading,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          label: const Text('Password'),
                          prefixIcon: const Icon(Icons.lock_outline),
                          errorText: errorText,
                        ),
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      width: double.maxFinite,
                      child: switch (loading) {
                        true => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        false => ElevatedButton(
                            onPressed: () => _signIn(context),
                            child: const Text('Sign in'),
                          ),
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

  void _signIn(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    context.read<SignInBloc>().signIn(email, password);
  }

  void _navigateToMainPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const MainPage(),
      ),
    );
  }
}
