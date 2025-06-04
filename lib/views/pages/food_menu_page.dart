import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as badges;
import 'package:order_now/views/components/food_tile.dart';
import 'package:order_now/views/components/list_tile.dart';
import 'package:order_now/views/components/my_tab_bar.dart';
import 'package:order_now/views/components/profile_image.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            child: Text(
              "Suruchi",
              style: TextStyle(fontFamily: 'Lobster', fontSize: 50),
            ),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              label: Text("1"),
              child: ProfileImage(height: 80, width: 50),
            ),
          ),

          SizedBox(width: 20),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Order you favourite food",
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyListTile(active: true),
                  MyListTile(active: true),
                  MyListTile(active: true),
                  MyListTile(active: true),
                  MyListTile(active: false),
                  MyListTile(active: true),
                  MyListTile(active: true),
                  MyListTile(active: false),
                  MyListTile(active: true),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  FoodTile(
                    imagePath: 'assets/images/food/Group 19.png',
                    title: 'Dosa',
                    subTitle: 'Masala Dosa',
                    rating: 4.9,
                  ),
                  FoodTile(
                    imagePath: 'assets/images/food/Group 19.png',
                    title: 'Avalakki',
                    subTitle: 'Veggie Burger',
                    rating: 4.8,
                  ),
                  FoodTile(
                    imagePath: 'assets/images/samosa.png',
                    title: 'Samosa',
                    subTitle: '',
                    rating: 4.6,
                  ),
                  FoodTile(
                    imagePath: 'assets/images/food/Group 19.png',
                    title: 'Juice',
                    subTitle: 'Pineapple Juice',
                    rating: 4.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
