import 'package:flutter/foundation.dart';

class Food {
  final String id;
  final String category;
  final String title;
  final String imageUrl;
  final quantity;
  final double calories;
  final double carbs;
  final double fat;
  final double protein;
  final double sugar;
  final double sodium;

  const Food({
    @required this.id,
    @required this.category,
    @required this.title,
    @required this.imageUrl,
    this.quantity,
    @required this.calories,
    @required this.carbs,
    @required this.fat,
    @required this.protein,
    @required this.sugar,
    @required this.sodium,
  });
}
