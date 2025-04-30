import '../models/user.dart';

class UserData {
  static final User currentUser = User(
    id: '1',
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '+91 9876543210',
    imageUrl: 'https://example.com/profile.jpg',
    addresses: [
      Address(
        id: '1',
        title: 'Home',
        address: '123, Green Park, New Delhi',
        landmark: 'Near Metro Station',
        isDefault: true,
      ),
      Address(
        id: '2',
        title: 'Office',
        address: '456, Cyber City, Gurgaon',
        landmark: 'Opposite Shopping Mall',
        isDefault: false,
      ),
    ],
    savedRestaurants: ['1', '2'],
    favoriteDishes: ['1', '3'],
  );
} 