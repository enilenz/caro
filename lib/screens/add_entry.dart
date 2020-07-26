import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:caro/providers/foods.dart';

class AddEntry extends StatefulWidget {
  static const routName = '/addEntry';

  @override
  _AddEntryState createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  bool isSearching = false;

  static const categoriesUrl =
      'https://www.nigerianfoods.herokuapp.com/api/food_category/';

  @override
  Widget build(BuildContext context) {
    final foodsProvider = Provider.of<Foods>(context).food;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Entry'),
        backgroundColor: Colors.teal[800],
        leading: Hero(
          tag: 'addEntry',
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: Text('${foodsProvider[0].id}  ${foodsProvider[0].calories}'),
    );
  }
}
