class Offer {
  final String id;
  final String title;
  final String description;
  final double discount;
  final String code;
  final DateTime validUntil;
  final String restaurantId;

  Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.code,
    required this.validUntil,
    required this.restaurantId,
  });
} 