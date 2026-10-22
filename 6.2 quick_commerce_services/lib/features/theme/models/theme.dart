import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static const _primaryColor = Color(0xFF13EC92);
  static const _onPrimaryColor = Color(0xFF003822);
  static const _scaffoldBackgroundColor = Color(0xFFF6F8F7);
  static const _primaryColorDark = Color(0xFF0E9D63);
  static const _borderColor = Color(0xFFE5E7EB);
  static const _mainTextColor = Color(0xFF0D1B16);
  static const _filledButtonColor = Color(0xFF1A2C24);
  static const _textButtonColor = Color(0xFF4C9A79);
  static const _errorColor = Color(0xFFEF4444);

  static ThemeData get make => ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    primaryColor: _primaryColor,
    primaryColorDark: _primaryColorDark,
    colorScheme: const ColorScheme.light(primary: _primaryColor,
    onPrimary: _onPrimaryColor),
    appBarTheme: AppBarTheme(
      actionsPadding: const EdgeInsets.only(right: 16),
      elevation: 0,
      backgroundColor: _scaffoldBackgroundColor,
      titleTextStyle: GoogleFonts.plusJakartaSans(
        color: _mainTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: _mainTextColor,
        textStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        elevation: 8,
        shadowColor: _primaryColor.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _filledButtonColor,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        shadowColor: Colors.black.withValues(alpha: 0.3),
        elevation: 4,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: _borderColor),
      ),
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: GoogleFonts.plusJakartaSans(
        fontSize: 18,
        color: _mainTextColor,
      ),
      hintStyle: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Colors.grey.shade400,
      ),
      errorStyle: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w500,
        fontSize: 10,
        color: _errorColor,
      ),
      suffixIconColor: WidgetStateColor.fromMap({
        WidgetState.error: _errorColor,
        WidgetState.focused: _primaryColor,
        WidgetState.any: Colors.grey.shade400,
      }),
      outlineBorder: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: _primaryColorDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: _errorColor, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: _errorColor, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: _primaryColor, width: 2),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _textButtonColor,
        textStyle: TextStyle(fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: const StadiumBorder(),
      ),
    ),
  );
}
