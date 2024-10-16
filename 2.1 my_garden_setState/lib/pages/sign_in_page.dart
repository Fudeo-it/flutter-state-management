import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_garden/pages/main_page.dart';
import 'package:my_garden/repositories/auth_repository.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authRepository = AuthRepository();

  bool _loading = false;
  String? _errorText;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
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
                  enabled: !_loading,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    label: const Text('Email'),
                    prefixIcon: const Icon(Icons.email_outlined),
                    errorText: _errorText,
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
                  enabled: !_loading,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    label: const Text('Password'),
                    prefixIcon: const Icon(Icons.lock_outline),
                    errorText: _errorText,
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
                child: switch (_loading) {
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
          ),
        ),
      );

  void _signIn(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      _loading = true;
      _errorText = null;
    });

    late bool success;

    try {
      await _authRepository.signIn(email, password);
      success = true;
    } catch (error) {
      success = false;
    } finally {
      setState(() {
        _loading = false;
        _errorText = success ? null : 'Invalid credentials';
      });
    }

    if (success && context.mounted) {
      _navigateToMainPage(context);
    }
  }

  void _navigateToMainPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const MainPage(),
      ),
    );
  }
}
