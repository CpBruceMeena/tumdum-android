import '../models/order.dart';

class OrderData {
  static final List<Order> orders = [
    Order(
      id: '1',
      restaurantId: '1',
      restaurantName: 'The Green Bowl',
      items: [
        OrderItem(
          dishId: '1',
          dishName: 'Quinoa Salad Bowl',
          quantity: 2,
          price: 299,
        ),
        OrderItem(
          dishId: '2',
          dishName: 'Avocado Toast',
          quantity: 1,
          price: 249,
        ),
      ],
      totalAmount: 847,
      status: 'Delivered',
      orderDate: DateTime.now().subtract(const Duration(days: 2)),
      deliveryAddress: '123, Green Park, New Delhi',
      paymentMethod: 'UPI',
    ),
    Order(
      id: '2',
      restaurantId: '2',
      restaurantName: 'Spice Garden',
      items: [
        OrderItem(
          dishId: '3',
          dishName: 'Paneer Tikka Masala',
          quantity: 1,
          price: 199,
        ),
        OrderItem(
          dishId: '4',
          dishName: 'Dal Makhani',
          quantity: 2,
          price: 179,
        ),
      ],
      totalAmount: 557,
      status: 'On the way',
      orderDate: DateTime.now().subtract(const Duration(hours: 1)),
      deliveryAddress: '123, Green Park, New Delhi',
      paymentMethod: 'Credit Card',
    ),
  ];
} 