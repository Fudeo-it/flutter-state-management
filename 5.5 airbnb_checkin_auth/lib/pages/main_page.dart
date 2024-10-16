import 'package:airbnb_checkin/cubits/auth/auth_cubit.dart';
import 'package:airbnb_checkin/pages/home/home_page.dart';
import 'package:airbnb_checkin/pages/sign_in/sign_in_page.dart';
import 'package:airbnb_checkin/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
        listener: (context, state) => switch (state) {
          AuthenticatedAuthState() => _replacePage(
              context,
              const HomePage(),
            ),
          NotAuthenticatedAuthState() => _replacePage(
              context,
              const SignInPage(),
            ),
          _ => null,
        },
        child: const Scaffold(
          body: LoadingWidget(),
        ),
      );

  void _replacePage(
    BuildContext context,
    Widget page,
  ) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}
