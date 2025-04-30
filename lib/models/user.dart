class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String imageUrl;
  final List<Address> addresses;
  final List<String> savedRestaurants;
  final List<String> favoriteDishes;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.addresses,
    required this.savedRestaurants,
    required this.favoriteDishes,
  });
}

class Address {
  final String id;
  final String title;
  final String address;
  final String landmark;
  final bool isDefault;

  Address({
    required this.id,
    required this.title,
    required this.address,
    required this.landmark,
    required this.isDefault,
  });
} 