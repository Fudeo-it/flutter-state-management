import 'package:flutter/material.dart';
import 'package:my_garden/features/theme/models/theme.dart';
import 'package:my_garden/pages/sign_in_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'My Garden',
        debugShowCheckedModeBanner: false,
        theme: LightTheme.make,
        themeMode: ThemeMode.dark,
        home: const SignInPage(),
      );
}
