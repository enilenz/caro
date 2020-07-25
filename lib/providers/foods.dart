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

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  List<Food> _food = [];
  List<Food> get food {
    return [..._food];
  }

  Future<void> getRiceBased() async {
    isLoading = true;
    try {
      final response = await http.get(
          'https://nigerianfoods.herokuapp.com/api/food_category/rice-based');
      final extractedData = json.decode(response.body);
      final List<Food> loadedProducts = [];

      print(extractedData);

      if (response.statusCode == 200) {
        extractedData['rice-based'].forEach((food) {
          print(food);
          food.forEach((key, val) {
            var foodId = key;
            var foodData = val;

            loadedProducts.add(Food(
              id: foodId,
              title: foodId,
              category: foodData['category'],
              imageUrl: foodData['img_url'],
              calories:
                  double.parse(foodData['nutritonal_information']['calories']),
              carbs: double.parse(foodData['nutritonal_information']['carbs']),
              protein:
                  double.parse(foodData['nutritonal_information']['protein']),
              fat: double.parse(foodData['nutritonal_information']['fat']),
              sodium:
                  double.parse(foodData['nutritonal_information']['sodium']),
              sugar: double.parse(foodData['nutritonal_information']['sugar']),
            ));
          });
        });
      } else {
        isLoading = false;
      }

      isLoading = false;

      _food = loadedProducts;
      notifyListeners();
    } catch (e) {
      print(e);
      throw (e);
    }
    isLoading = false;
  }
}
