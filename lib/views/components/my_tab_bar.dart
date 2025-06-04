import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TabBar(
        isScrollable: true,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black54,
        labelStyle: const TextStyle(fontFamily: 'Roboto', fontSize: 16),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
        ),
        indicator: BoxDecoration(
          color: Color(0xFFEF2A39), // Red
          borderRadius: BorderRadius.vertical(),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        tabs: [
          Tab(
            child: Text(
              "All",
              style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
            ),
          ),
          Tab(
            child: Text(
              "Food",
              style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
            ),
          ),
          Tab(
            child: Text(
              "Drinks",
              style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
            ),
          ),
          Tab(
            child: Text(
              "Icecreams",
              style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
            ),
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
