class Order {
  final String id;
  final String restaurantId;
  final String restaurantName;
  final List<OrderItem> items;
  final double totalAmount;
  final String status;
  final DateTime orderDate;
  final String deliveryAddress;
  final String paymentMethod;

  Order({
    required this.id,
    required this.restaurantId,
    required this.restaurantName,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.orderDate,
    required this.deliveryAddress,
    required this.paymentMethod,
  });
}

class OrderItem {
  final String dishId;
  final String dishName;
  final int quantity;
  final double price;

  OrderItem({
    required this.dishId,
    required this.dishName,
    required this.quantity,
    required this.price,
  });
} 