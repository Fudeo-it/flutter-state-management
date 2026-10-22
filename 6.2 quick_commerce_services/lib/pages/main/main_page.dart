import 'package:flutter/material.dart';
import 'package:quick_commerce_app/pages/cart/cart_page.dart';
import 'package:quick_commerce_app/pages/main/widgets/bottom_nav_bar.dart';
import 'package:quick_commerce_app/pages/products/products_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: _currentIndex,
      children: [ProductsPage(), Placeholder(), CartPage(), Placeholder()],
    ),
    bottomNavigationBar: BottomNavBar(
      selectedIndex: _currentIndex,
      onItemSelected: (index) => _onItemSelected(context, index),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Esplora',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Carrello',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Profilo',
        ),
      ],
    ),
  );

  void _onItemSelected(BuildContext context, int index) => switch (index) {
    3 => _onProfileTap(context),
    _ => setState(() {
      _currentIndex = index;
    }),
  };

  void _onProfileTap(BuildContext context) {}
}
