import 'package:flutter/material.dart';

import 'models/category.dart';
import 'providers/food.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'bean',
    title: 'Bean-based',
  ),
  Category(
    id: 'bev',
    title: 'Beverages',
  ),
  Category(
    id: 'cassava',
    title: 'Cassava-based',
  ),
  Category(
    id: 'meat',
    title: 'Meat based',
  ),
  Category(
    id: 'others',
    title: 'Others',
  ),
  Category(
    id: 'rice',
    title: 'Rice-based',
  ),
  Category(
    id: 'snacks',
    title: 'Snacks',
  ),
  Category(
    id: 'soups',
    title: 'Soups and Stews',
  ),
  Category(
    id: 'yam',
    title: 'Yam-based',
  ),
];

List<Category> get categories {
  return [...DUMMY_CATEGORIES];
}

const DUMMY_MEALS = const [
  Food(
    id: 'eba',
    categories: 'cassava',
    title: 'Spaghetti with Tomato Sauce',
  ),
];
