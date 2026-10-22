import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAllButton extends StatelessWidget {
  final GestureTapCallback? onPressed;

  const SeeAllButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    child: Text(
      'Mostra tutto',
      style: GoogleFonts.plusJakartaSans(
        fontSize: 14,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}
