class Food {
  final String name;
  final String description;
  final String imagePath;
  final int price;
  final FoodCategory foodCategory;
  List<Addon> avaliableAddon;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.foodCategory,
    required this.avaliableAddon,
  });
}

enum FoodCategory { juices, food, soda, dosa }

class Addon {
  String name;
  String price;

  Addon({required this.name, required this.price});
}
