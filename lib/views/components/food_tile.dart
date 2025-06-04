import 'package:flutter/material.dart';
import 'package:order_now/views/pages/food_page.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.rating,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoodPage()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 80),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              subTitle,
              style: TextStyle(fontFamily: 'Roboto', color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Text(rating.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
