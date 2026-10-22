import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final bool enabled;

  const EmailTextField({
    super.key,
    required this.controller,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
        child: Text(
          'Email',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
          ),
        ),
      ),
      TextField(
        controller: controller,
        enabled: enabled,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'hello@example.com',
          errorText: errorText,
          suffixIcon: const Icon(Icons.mail_outline_rounded, size: 20.0),
        ),
      ),
    ],
  );
}
