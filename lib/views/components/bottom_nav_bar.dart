import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:order_now/views/pages/cart.dart';
import 'package:order_now/views/pages/favourite.dart';
import 'package:order_now/views/pages/food_menu_page.dart';
import 'package:order_now/views/pages/food_page.dart';
import 'package:order_now/views/pages/setup.dart';
import 'package:order_now/views/pages/user.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> pages = [FoodMenuPage(), Setup(), FavoritesPage(), Cart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: FluidNavBar(
        onChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        icons: [
          FluidNavBarIcon(svgPath: "assets/svg/home.svg"),
          FluidNavBarIcon(svgPath: "assets/svg/user.svg"),
          FluidNavBarIcon(svgPath: "assets/svg/heart.svg"),
          FluidNavBarIcon(svgPath: "assets/svg/shopping.svg"),
        ],
        style: FluidNavBarStyle(
          barBackgroundColor: Color(0xFFEF2A39),
          iconUnselectedForegroundColor: Colors.white,
          iconSelectedForegroundColor: Colors.white,
        ),
        scaleFactor: 2,
        animationFactor: 0.5,
      ),
    );
  }
}
