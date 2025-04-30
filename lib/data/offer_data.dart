import '../models/offer.dart';

class OfferData {
  static final List<Offer> offers = [
    Offer(
      id: '1',
      title: '50% OFF on First Order',
      description: 'Get 50% off on your first order above ₹300',
      discount: 50.0,
      code: 'FIRST50',
      validUntil: DateTime.now().add(const Duration(days: 30)),
      restaurantId: '1',
    ),
    Offer(
      id: '2',
      title: 'Free Delivery',
      description: 'Free delivery on orders above ₹500',
      discount: 0.0,
      code: 'FREEDEL',
      validUntil: DateTime.now().add(const Duration(days: 15)),
      restaurantId: '2',
    ),
    Offer(
      id: '3',
      title: '20% OFF on Chinese',
      description: 'Get 20% off on all Chinese restaurants',
      discount: 20.0,
      code: 'CHINESE20',
      validUntil: DateTime.now().add(const Duration(days: 7)),
      restaurantId: '3',
    ),
  ];
} 