import 'package:flutter/material.dart';

class Nutrition {

  final String id;
  final String title;
  final Color color;

  Nutrition({
    @required this.id,
    @required this.title,
    this.color = Colors.teal
  });
}

class NutritionList with ChangeNotifier{

  List<Nutrition> _nutritionList = [
    Nutrition(
      title: 'carbs',
      id: 'carbs',
    ),
    Nutrition(
      title: 'fat',
      id: 'fat',
      color: Colors.indigo,
    ),
    Nutrition(
        title: 'protein',
        id: 'protein',
        color: Colors.tealAccent
    )
  ];

  List<Nutrition> get nutritionList{
    return [..._nutritionList];

  }

}