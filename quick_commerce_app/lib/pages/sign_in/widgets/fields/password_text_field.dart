import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  final bool enabled;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
        child: Text(
          'Password',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
          ),
        ),
      ),
      TextField(
        controller: widget.controller,
        enabled: widget.enabled,
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: '••••••••',
          errorText: widget.errorText,
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _obscureText = !_obscureText;
            }),
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_rounded,
              size: 20.0,
            ),
          ),
        ),
      ),
    ],
  );
}
