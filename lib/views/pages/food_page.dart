import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as badges;
import 'package:order_now/views/components/minus_button.dart';
import 'package:order_now/views/components/order_now_buttom.dart';
import 'package:order_now/views/components/plus_button.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: badges.Badge(
                label: Text("1"),
                backgroundColor: Colors.black,
                textColor: Colors.white,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset("assets/images/food/Group 19.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Dosa",
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 40),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Craving something crispy, comforting, and bursting with flavor? Dive into our Masala Dosa – a thin, golden dosa wrapped around a warm, spiced potato filling. Each bite is a perfect blend of crunch and softness, paired with our signature coconut chutney and flavorful sambar.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MinusButton(),
                      SizedBox(width: 10),
                      Text("4"),
                      SizedBox(width: 15),
                      PlusButton(),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: OrderNowButtom(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
