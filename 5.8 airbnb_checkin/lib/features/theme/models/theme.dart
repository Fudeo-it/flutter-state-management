import 'package:flutter/material.dart';

class LightTheme {
  static const _primaryColor = Color(0xFFde4058);

  static get make => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
        primaryColor: _primaryColor,
        colorScheme: const ColorScheme.light(
          primary: _primaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          elevation: 2.0,
          iconTheme: IconThemeData(
            color: Colors.grey.shade900,
          ),
          centerTitle: false,
        ),
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(const EdgeInsets.all(16.0)),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(const EdgeInsets.all(16.0)),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            side: const WidgetStatePropertyAll(
              BorderSide(color: _primaryColor),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(const EdgeInsets.all(16.0)),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade500,
          thickness: 0.6,
          space: 0.0,
        ),
        cardTheme: CardTheme(
          margin: EdgeInsets.zero,
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            side: BorderSide(
              width: 0.6,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      );
}
