import 'dart:io';
import 'package:image/image.dart';

void main() {
  // Create directories if they don't exist
  final restaurantsDir = Directory('assets/images/restaurants');
  final dishesDir = Directory('assets/images/dishes');
  
  if (!restaurantsDir.existsSync()) {
    restaurantsDir.createSync(recursive: true);
  }
  if (!dishesDir.existsSync()) {
    dishesDir.createSync(recursive: true);
  }

  // Generate restaurant placeholders
  for (int i = 1; i <= 5; i++) {
    final image = Image(width: 400, height: 300);
    
    // Fill with light green color
    fill(image, color: ColorRgb8(200, 250, 200));
    
    // Add text
    final text = 'Restaurant $i';
    drawString(
      image,
      text,
      font: arial48,
      x: (400 - text.length * 20) ~/ 2,
      y: 120,
      color: ColorRgb8(50, 50, 50),
    );

    // Save the image
    final png = encodePng(image);
    File('${restaurantsDir.path}/restaurant_$i.jpg')
      ..writeAsBytesSync(png);
  }

  // Generate dish placeholders
  for (int i = 1; i <= 10; i++) {
    final image = Image(width: 300, height: 300);
    
    // Fill with light orange color
    fill(image, color: ColorRgb8(255, 230, 200));
    
    // Add text
    final text = 'Dish $i';
    drawString(
      image,
      text,
      font: arial48,
      x: (300 - text.length * 20) ~/ 2,
      y: 120,
      color: ColorRgb8(50, 50, 50),
    );

    // Save the image
    final png = encodePng(image);
    File('${dishesDir.path}/dish_$i.jpg')
      ..writeAsBytesSync(png);
  }

  print('Generated placeholder images successfully!');
} 