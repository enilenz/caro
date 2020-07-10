import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final quantity;
  final double calories;
  final double carbs;
  final double fat;
  final double protein;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    this.quantity,
    @required this.calories,
    @required this.carbs,
    @required this.fat,
    @required this.protein,

  });
}
