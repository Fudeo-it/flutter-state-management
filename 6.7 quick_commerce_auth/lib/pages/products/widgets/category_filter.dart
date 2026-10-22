import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _categories = [
  'Tutti',
  'Elettronica',
  'Informatica',
  'Ufficio',
  'Casa',
  'Giardino',
  'Sport',
  'Abbigliamento',
];

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: _categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == 'Tutti';

          return Material(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(30),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: isSelected
                      ? null
                      : Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: Text(
                  category,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
