import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_commerce_app/pages/sign_in/widgets/buttons/continue_as_guest_button.dart';
import 'package:quick_commerce_app/pages/sign_in/widgets/buttons/forgot_password_button.dart';
import 'package:quick_commerce_app/pages/sign_in/widgets/buttons/sign_in_button.dart';
import 'package:quick_commerce_app/pages/sign_in/widgets/fields/email_text_field.dart';
import 'package:quick_commerce_app/pages/sign_in/widgets/fields/password_text_field.dart';
import 'package:quick_commerce_app/pages/sign_in/widgets/sign_in_logo.dart';
import 'package:quick_commerce_app/providers/auth/auth_provider.dart';
import 'package:quick_commerce_app/widgets/loading_widget.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInMutation);

    final loading = signInState.isPending;
    final errorText = signInState.hasError ? 'Credenziali errate' : null;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: ContinueAsGuestButton(
                  onPressed: () => _navigateToMainPage(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    SignInLogo(),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        'Bentornato',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(
                            context,
                          ).inputDecorationTheme.labelStyle?.color,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Accedi per continuare lo shopping',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16.0,
                          color: Color(0xFF4C9A79),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: EmailTextField(
                  controller: _emailController,
                  errorText: errorText,
                  enabled: !loading,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: PasswordTextField(
                  controller: _passwordController,
                  errorText: errorText,
                  enabled: !loading,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ForgotPasswordButton(onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: switch (loading) {
                  true => LoadingWidget(),
                  false => SignInButton(onPressed: () => _signIn(context)),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final user = await ref
        .read(authProvider.notifier)
        .signIn(email: email, password: password);

    if (context.mounted && user != null) {
      _navigateToMainPage(context);
    }
  }

  void _navigateToMainPage(BuildContext context) {
    Navigator.of(context).maybePop();
  }
}
