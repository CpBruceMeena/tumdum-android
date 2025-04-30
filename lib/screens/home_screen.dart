import 'package:flutter/material.dart';
import '../data/restaurant_data.dart';
import '../models/restaurant.dart';
import 'profile_screen.dart';
import 'orders_screen.dart';
import 'offers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  List<Restaurant> _filteredRestaurants = RestaurantData.restaurants;
  String _currentAddress = 'Home';

  @override
  void initState() {
    super.initState();
    _filteredRestaurants = RestaurantData.restaurants;
  }

  void _handleSearch() {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        _filteredRestaurants = RestaurantData.restaurants
            .where((restaurant) =>
                restaurant.name.toLowerCase().contains(_searchController.text.toLowerCase()) ||
                restaurant.cuisine.toLowerCase().contains(_searchController.text.toLowerCase()))
            .toList();
      });
    }
  }

  void _handleCartTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OrdersScreen()),
    );
  }

  void _handleProfileTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  void _handleOffersTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OffersScreen()),
    );
  }

  void _handleLocationChange() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Delivery Address'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Enter new address',
                hintText: 'Enter your full address',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _currentAddress = 'Home';
                      Navigator.pop(context);
                    });
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                ),
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _currentAddress = 'Work';
                      Navigator.pop(context);
                    });
                  },
                  icon: const Icon(Icons.work),
                  label: const Text('Work'),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_addressController.text.isNotEmpty) {
                setState(() {
                  _currentAddress = _addressController.text;
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _handleRestaurantTap(Restaurant restaurant) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(restaurant.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating: ${restaurant.rating}'),
            Text('Cuisine: ${restaurant.cuisine}'),
            const SizedBox(height: 8),
            const Text('Popular Dishes:'),
            ...restaurant.popularDishes.map((dish) => ListTile(
              leading: Image.asset(
                dish.imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: const Icon(Icons.fastfood),
                  );
                },
              ),
              title: Text(dish.name),
              subtitle: Text('₹${dish.price}'),
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _filterRestaurantsByCategory(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      if (index == 0) {
        _filteredRestaurants = RestaurantData.restaurants;
      } else {
        final category = RestaurantData.categories[index];
        _filteredRestaurants = RestaurantData.restaurants
            .where((restaurant) => restaurant.cuisine.toLowerCase() == category.toLowerCase())
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tumdum'),
        actions: [
          IconButton(
            icon: const Icon(Icons.local_offer),
            onPressed: _handleOffersTap,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: _handleCartTap,
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _handleProfileTap,
          ),
        ],
      ),
      body: Column(
        children: [
          // Location and Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Deliver to: $_currentAddress',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton.icon(
                  onPressed: _handleLocationChange,
                  icon: const Icon(Icons.edit_location_alt),
                  label: const Text('Change'),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              onSubmitted: (_) => _handleSearch(),
              decoration: InputDecoration(
                hintText: 'Search for restaurants or dishes',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Voice search coming soon!')),
                    );
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Categories
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: RestaurantData.categories.length,
              itemBuilder: (context, index) {
                final category = RestaurantData.categories[index];
                final isSelected = _selectedCategoryIndex == index;
                return GestureDetector(
                  onTap: () => _filterRestaurantsByCategory(index),
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? Colors.green : Colors.grey[300]!,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _getCategoryIcon(category),
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Restaurant List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = _filteredRestaurants[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () => _handleRestaurantTap(restaurant),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                          child: Image.asset(
                            restaurant.imagePath,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 200,
                                color: Colors.grey[300],
                                child: const Icon(Icons.restaurant, size: 64),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    restaurant.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          restaurant.rating.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                restaurant.cuisine,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '₹${restaurant.priceForTwo} for two',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'all':
        return Icons.all_inclusive;
      case 'indian':
        return Icons.rice_bowl;
      case 'chinese':
        return Icons.ramen_dining;
      case 'italian':
        return Icons.local_pizza;
      case 'fast food':
        return Icons.fastfood;
      default:
        return Icons.restaurant;
    }
  }
} 