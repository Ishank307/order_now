import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as badges;
import 'package:order_now/majestic/ui/auth_page/widgets/section_separator.dart';
import 'package:order_now/views/components/custom_botton.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<String> productName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Chery',
    'Peach',
    'Mixed Fruit Basket',
  ];
  List<String> productUnit = ['KG', 'Dozen', 'KG', 'Dozen', 'KG', 'KG', 'KG'];
  List<int> productPrice = [10, 20, 30, 40, 50, 60, 70];
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
    'https://media.istockphoto.com/id/1273378551/photo/set-of-summer-fruits-and-berries-in-wooden-serving.jpg?s=2048x2048&w=is&k=20&c=T3OuYRySJb1amEksKLE_5eM1Uw_ww-jurpo1ZOGFaMM=',
    'https://media.istockphoto.com/id/175589268/photo/fresh-organic-produce-in-fruit-basket.jpg?s=2048x2048&w=is&k=20&c=uL3fjgF2KU94DU60VSkIgay5JntdO73BXfSa2jELanQ=',
    'https://media.istockphoto.com/id/927805638/photo/fresh-fruits-mixed-fruits-background-healthy-eating-dieting-love-fruits.jpg?s=2048x2048&w=is&k=20&c=0OzoTHgTUbJVBqRSEKXiBhtZUj7UBPq6MJUmpS2qGsE=',
    'https://media.istockphoto.com/id/1078078874/photo/assorted-fresh-fruits-in-a-basket.jpg?s=2048x2048&w=is&k=20&c=AS-r6vS88Z_khrbxszcnHLEo1RPMj30HWQqvsi3f-gg=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: badges.Badge(
                label: Text("1"),
                backgroundColor: Colors.black,
                textColor: Colors.white,
                child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                productImage[index].toString(),
                              ),
                            ),
                            SizedBox(width: 50),
                            Text(
                              productName[index].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          CustomBotton(text: "Checkout"),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
