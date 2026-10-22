import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarItem extends StatelessWidget {
  final BottomNavigationBarItem item;
  final bool active;
  final GestureTapCallback? onTap;

  const NavBarItem(this.item, {super.key, this.active = false, this.onTap});

  @override
  Widget build(BuildContext context) => Material(
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.0,
          children: [
            IconTheme(
              data: IconThemeData(
                color: active
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade500,
              ),
              child: item.icon,
            ),
            if (item.label != null)
              Text(
                item.label!,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: active ? FontWeight.w800 : FontWeight.w500,
                  color: active
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade500,
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
