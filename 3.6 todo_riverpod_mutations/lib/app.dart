import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/theme/models/theme.dart';
import 'package:todo/pages/todos_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: MaterialApp(
          title: 'Todo',
          debugShowCheckedModeBanner: false,
          theme: LightTheme.make,
          themeMode: ThemeMode.dark,
          home: const TodosPage(),
        ),
      );
}
