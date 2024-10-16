import 'package:airbnb_checkin/di/dependency_injector.dart';
import 'package:airbnb_checkin/features/theme/models/theme.dart';
import 'package:airbnb_checkin/pages/main_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjector(
    child: MaterialApp(
          title: 'Check-In App',
          debugShowCheckedModeBanner: false,
          theme: LightTheme.make,
          themeMode: ThemeMode.light,
          home: const MainPage(),
        ),
  );
}
