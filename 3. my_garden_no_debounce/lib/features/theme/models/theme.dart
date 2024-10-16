import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static const _primaryColor = Color(0xFF079669);
  static const _primaryColorDark = Color(0xFF043c1c);

  static get make => ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: _primaryColorDark,
    primaryColor: _primaryColor,
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 32.0,
    ),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(16.0)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 18.0),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.05),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
      ),
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: GoogleFonts.roboto(
        fontSize: 18,
        color: Colors.white.withOpacity(0.6),
      ),
      hintStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Colors.white.withOpacity(0.8),
      ),
      errorStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: 10,
        color: Colors.red.shade400,
      ),
      prefixIconColor: Colors.white.withOpacity(0.6),
      outlineBorder: BorderSide(
        color: Colors.white.withOpacity(0.2),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: _primaryColorDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.red.shade400, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.red.shade400, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: _primaryColor, width: 2),
      ),
    ),
    cardTheme: CardTheme(
      margin: EdgeInsets.zero,
      color: _primaryColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );
}
