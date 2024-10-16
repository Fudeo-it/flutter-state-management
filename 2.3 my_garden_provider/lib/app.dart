import 'package:flutter/material.dart';
import 'package:my_garden/features/theme/models/theme.dart';
import 'package:my_garden/pages/sign_in_page.dart';
import 'package:my_garden/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => Provider<AuthRepository>(
    create: (_) => AuthRepository(),
    child: MaterialApp(
      title: 'My Garden',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.make,
      themeMode: ThemeMode.dark,
      home: const SignInPage(),
    ),
  );
}
