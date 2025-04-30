import '../models/restaurant.dart';
import '../models/dish.dart';

class RestaurantData {
  static final List<String> categories = [
    'All',
    'Indian',
    'Chinese',
    'Italian',
    'Fast Food',
  ];

  static final List<Restaurant> restaurants = [
    // Indian Restaurants
    Restaurant(
      id: '1',
      name: 'Spice Garden',
      cuisine: 'Indian',
      rating: 4.5,
      priceForTwo: 500,
      imagePath: 'assets/images/restaurants/restaurant_1.jpg',
      popularDishes: [
        Dish(
          id: '1',
          name: 'Butter Chicken',
          price: 350,
          imagePath: 'assets/images/dishes/dish_1.jpg',
        ),
        Dish(
          id: '2',
          name: 'Biryani',
          price: 280,
          imagePath: 'assets/images/dishes/dish_2.jpg',
        ),
      ],
    ),
    Restaurant(
      id: '2',
      name: 'Tandoori Nights',
      cuisine: 'Indian',
      rating: 4.3,
      priceForTwo: 450,
      imagePath: 'assets/images/restaurants/restaurant_2.jpg',
      popularDishes: [
        Dish(
          id: '3',
          name: 'Paneer Tikka',
          price: 250,
          imagePath: 'assets/images/dishes/dish_3.jpg',
        ),
        Dish(
          id: '4',
          name: 'Dal Makhani',
          price: 200,
          imagePath: 'assets/images/dishes/dish_4.jpg',
        ),
      ],
    ),

    // Chinese Restaurants
    Restaurant(
      id: '3',
      name: 'Dragon Palace',
      cuisine: 'Chinese',
      rating: 4.4,
      priceForTwo: 600,
      imagePath: 'assets/images/restaurants/restaurant_3.jpg',
      popularDishes: [
        Dish(
          id: '5',
          name: 'Hakka Noodles',
          price: 220,
          imagePath: 'assets/images/dishes/dish_5.jpg',
        ),
        Dish(
          id: '6',
          name: 'Manchurian',
          price: 180,
          imagePath: 'assets/images/dishes/dish_6.jpg',
        ),
      ],
    ),
    Restaurant(
      id: '4',
      name: 'Wok & Roll',
      cuisine: 'Chinese',
      rating: 4.2,
      priceForTwo: 550,
      imagePath: 'assets/images/restaurants/restaurant_4.jpg',
      popularDishes: [
        Dish(
          id: '7',
          name: 'Spring Rolls',
          price: 150,
          imagePath: 'assets/images/dishes/dish_7.jpg',
        ),
        Dish(
          id: '8',
          name: 'Szechuan Rice',
          price: 200,
          imagePath: 'assets/images/dishes/dish_8.jpg',
        ),
      ],
    ),

    // Italian Restaurants
    Restaurant(
      id: '5',
      name: 'Pasta Paradise',
      cuisine: 'Italian',
      rating: 4.6,
      priceForTwo: 700,
      imagePath: 'assets/images/restaurants/restaurant_5.jpg',
      popularDishes: [
        Dish(
          id: '9',
          name: 'Margherita Pizza',
          price: 300,
          imagePath: 'assets/images/dishes/dish_9.jpg',
        ),
        Dish(
          id: '10',
          name: 'Pasta Alfredo',
          price: 280,
          imagePath: 'assets/images/dishes/dish_10.jpg',
        ),
      ],
    ),
    Restaurant(
      id: '6',
      name: 'Bella Italia',
      cuisine: 'Italian',
      rating: 4.4,
      priceForTwo: 650,
      imagePath: 'assets/images/restaurants/restaurant_6.jpg',
      popularDishes: [
        Dish(
          id: '11',
          name: 'Lasagna',
          price: 320,
          imagePath: 'assets/images/dishes/dish_11.jpg',
        ),
        Dish(
          id: '12',
          name: 'Risotto',
          price: 350,
          imagePath: 'assets/images/dishes/dish_12.jpg',
        ),
      ],
    ),

    // Fast Food Restaurants
    Restaurant(
      id: '7',
      name: 'Burger King',
      cuisine: 'Fast Food',
      rating: 4.3,
      priceForTwo: 400,
      imagePath: 'assets/images/restaurants/restaurant_7.jpg',
      popularDishes: [
        Dish(
          id: '13',
          name: 'Whopper',
          price: 200,
          imagePath: 'assets/images/dishes/dish_13.jpg',
        ),
        Dish(
          id: '14',
          name: 'Chicken Fries',
          price: 150,
          imagePath: 'assets/images/dishes/dish_14.jpg',
        ),
      ],
    ),
    Restaurant(
      id: '8',
      name: 'McDonald\'s',
      cuisine: 'Fast Food',
      rating: 4.2,
      priceForTwo: 350,
      imagePath: 'assets/images/restaurants/restaurant_8.jpg',
      popularDishes: [
        Dish(
          id: '15',
          name: 'Big Mac',
          price: 180,
          imagePath: 'assets/images/dishes/dish_15.jpg',
        ),
        Dish(
          id: '16',
          name: 'McFlurry',
          price: 120,
          imagePath: 'assets/images/dishes/dish_16.jpg',
        ),
      ],
    ),
  ];
} 