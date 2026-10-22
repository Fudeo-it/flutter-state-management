import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool showNext;
  final Color? iconColor;
  final Color? iconBgColor;
  final Color? textColor;
  final GestureTapCallback? onTap;

  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.showNext = false,
    this.iconColor,
    this.iconBgColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              margin: EdgeInsets.only(right: 16.0),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(44.0),
              ),
              child: Icon(icon, color: iconColor, size: 22.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2.0,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                    ),
                ],
              ),
            ),
            if (showNext)
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey.shade300,
                size: 24.0,
              ),
          ],
        ),
      ),
    ),
  );
}
