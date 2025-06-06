import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as badges;
import 'package:order_now/views/components/food_tile.dart';
import 'package:order_now/views/components/profile_image.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Sample favorite items - you can replace this with actual data from your backend/database
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'imagePath': 'assets/images/food/Group 19.png',
      'title': 'Dosa',
      'subTitle': 'Masala Dosa',
      'rating': 4.9,
    },
    {
      'imagePath': 'assets/images/samosa.png',
      'title': 'Samosa',
      'subTitle': 'Crispy Samosa',
      'rating': 4.6,
    },
    {
      'imagePath': 'assets/images/food/Group 19.png',
      'title': 'Juice',
      'subTitle': 'Pineapple Juice',
      'rating': 4.5,
    },
  ];

  void _removeFavorite(int index) {
    setState(() {
      favoriteItems.removeAt(index);
    });

    // Show snackbar for user feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Removed from favorites'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // You can implement undo functionality here
          },
        ),
      ),
    );
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
              "Favorites",
              style: TextStyle(fontFamily: 'Lobster', fontSize: 40),
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
            // Header section
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Your favorite dishes",
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Favorites count indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${favoriteItems.length} items",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (favoriteItems.isNotEmpty)
                    TextButton(
                      onPressed: () {
                        // Clear all favorites with confirmation
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Clear All Favorites'),
                              content: Text(
                                'Are you sure you want to remove all items from favorites?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      favoriteItems.clear();
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Clear All'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Clear All',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Favorites grid or empty state
            Expanded(
              child:
                  favoriteItems.isEmpty
                      ? _buildEmptyState()
                      : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio:
                                    0.8, // Adjust based on your FoodTile design
                              ),
                          itemCount: favoriteItems.length,
                          itemBuilder: (context, index) {
                            final item = favoriteItems[index];
                            return Stack(
                              children: [
                                FoodTile(
                                  imagePath: item['imagePath'],
                                  title: item['title'],
                                  subTitle: item['subTitle'],
                                  rating: item['rating'],
                                ),
                                // Remove from favorites button
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () => _removeFavorite(index),
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
          SizedBox(height: 20),
          Text(
            'No favorites yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Start adding your favorite dishes\nto see them here',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Navigate back to menu or home page
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text('Browse Menu', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
