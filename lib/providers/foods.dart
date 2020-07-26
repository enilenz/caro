import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'food.dart';

class Foods with ChangeNotifier {
  //Get a json response of the specified food
  static const foodNameUrl =
      'https://www.nigerianfoods.herokuapp.com/api/foods/';

  //Get a json response of every food in the database
  static const foodsUrl = 'https://www.nigerianfoods.herokuapp.com/api/foods';

  //Get a json response of a list of all the foods that belong to a particular category
  static const categoriesUrl =
      'https://www.nigerianfoods.herokuapp.com/api/food_category/';

  List<Food> _food = [];

  List<Food> get food {
    return [..._food];
  }

  Future<void> getRiceBased() async {
    try {
      final response = await http.get(
          'https://nigerianfoods.herokuapp.com/api/food_category/rice-based');
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Food> loadedProducts = [];

      extractedData.forEach((foodId, foodData) {
        loadedProducts.add(Food(
          id: foodId,
          title: foodId,
          category: foodData['coconut rice']['category'],
          imageUrl: foodData['coconut rice']['img_url'],
          calories: foodData['coconut rice']['nutritonal_information']
              ['calories'],
          carbs: foodData['coconut rice']['nutritonal_information']['carbs'],
          protein: foodData['coconut rice']['nutritonal_information']
              ['protein'],
          fat: foodData['coconut rice']['nutritonal_information']['fat'],
          sodium: foodData['coconut rice']['nutritonal_information']['sodium'],
          sugar: foodData['coconut rice']['nutritonal_information']['sugar'],
        ));
      });

      _food = loadedProducts;
      notifyListeners();
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
