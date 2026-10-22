import 'package:cinemapp/di/dependency_injector.dart';
import 'package:cinemapp/pages/main_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjector(
    child: MaterialApp(
      title: 'CinemApp',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const MainPage(),
    ),
  );
}
