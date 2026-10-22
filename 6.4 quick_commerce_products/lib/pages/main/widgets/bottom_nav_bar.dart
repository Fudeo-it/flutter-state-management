import 'package:flutter/material.dart';
import 'package:quick_commerce_app/pages/main/widgets/nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int>? onItemSelected;

  const BottomNavBar({
    super.key,
    this.items = const [],
    this.selectedIndex = 0,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.95),
      border: Border(top: BorderSide(color: Colors.grey.shade100)),
    ),
    child: SafeArea(
      child: Row(
        children: items
            .asMap()
            .entries
            .map((entry) {
              final MapEntry(key: index, value: item) = entry;
              final active = index == selectedIndex;

              return Expanded(
                child: NavBarItem(
                  item,
                  active: active,
                  onTap: () => onItemSelected?.call(index),
                ),
              );
            })
            .toList(growable: false),
      ),
    ),
  );
}
