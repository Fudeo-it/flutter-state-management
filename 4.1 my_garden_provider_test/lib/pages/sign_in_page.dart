import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_garden/pages/main_page.dart';
import 'package:my_garden/providers/sign_in_notifier.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => SignInNotifier(
          authRepository: context.read(),
        ),
        child: const _InnerSignInPage(),
      );
}

class _InnerSignInPage extends StatefulWidget {
  const _InnerSignInPage({super.key});

  @override
  State<_InnerSignInPage> createState() => _InnerSignInPageState();
}

class _InnerSignInPageState extends State<_InnerSignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<SignInNotifier>().addListener(_shouldNavigateToMainPage);
  }

  @override
  void dispose() {
    context.read<SignInNotifier>().removeListener(_shouldNavigateToMainPage);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Consumer<SignInNotifier>(
            builder: (context, state, _) => Column(
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
                    enabled: !state.loading,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      label: const Text('Email'),
                      prefixIcon: const Icon(Icons.email_outlined),
                      errorText: state.errorText,
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
                    enabled: !state.loading,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      label: const Text('Password'),
                      prefixIcon: const Icon(Icons.lock_outline),
                      errorText: state.errorText,
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
                  child: switch (state.loading) {
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
        ),
      );

  void _signIn(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    context.read<SignInNotifier>().signIn(email, password);
  }

  void _navigateToMainPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const MainPage(),
      ),
    );
  }

  void _shouldNavigateToMainPage() {
    final state = context.read<SignInNotifier>();
    if (state.success) {
      _navigateToMainPage(context);
    }
  }
}
