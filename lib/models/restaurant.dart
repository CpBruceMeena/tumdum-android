import 'dish.dart';

class Restaurant {
  final String id;
  final String name;
  final String cuisine;
  final double rating;
  final int priceForTwo;
  final String imagePath;
  final List<Dish> popularDishes;

  Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.priceForTwo,
    required this.imagePath,
    required this.popularDishes,
  });
} 