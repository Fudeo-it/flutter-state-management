import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_commerce_app/features/theme/models/theme.dart';
import 'package:quick_commerce_app/pages/main/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Quick Commerce',
        debugShowCheckedModeBanner: false,
        theme: LightTheme.make,
        themeMode: ThemeMode.dark,
        home: const MainPage(),
      ),
    );
  }
}
