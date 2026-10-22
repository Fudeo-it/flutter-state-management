import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoCodeTile extends StatelessWidget {
  final GestureTapCallback? onTap;

  const PromoCodeTile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16.0),
    child: Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        leading: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.local_offer,
            size: 18.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          'Applica Codice Promozionale',
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
            color: const Color(0xFF0D1B16),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    ),
  );
}
