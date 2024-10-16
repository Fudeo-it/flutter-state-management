import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden/features/theme/models/theme.dart';
import 'package:my_garden/pages/sign_in_page.dart';
import 'package:my_garden/repositories/auth_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => RepositoryProvider(
        create: (context) => AuthRepository(),
        child: MaterialApp(
          title: 'My Garden',
          debugShowCheckedModeBanner: false,
          theme: LightTheme.make,
          themeMode: ThemeMode.dark,
          home: const SignInPage(),
        ),
      );
}
