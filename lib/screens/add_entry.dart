import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:caro/providers/foods.dart';

import '../providers/foods.dart';

class AddEntry extends StatefulWidget {
  static const routName = '/addEntry';

  @override
  _AddEntryState createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  bool isSearching = false;
  Foods foodsProvider;
  var _isInit = false;

  // @override
  // initState() {
  //   super.initState();
  // }

  @override
  didChangeDependencies() {
    foodsProvider = Provider.of<Foods>(context);

    if (!_isInit) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        foodsProvider.getRiceBased();
      });
    }
    _isInit = true;
    super.didChangeDependencies();
  }

  static const categoriesUrl =
      'https://www.nigerianfoods.herokuapp.com/api/food_category/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Entry'),
        backgroundColor: Colors.teal[800],
        leading: Hero(
          tag: 'addEntry',
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: foodsProvider.isLoading
          ? Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text("Loading")
                ],
              ),
            )
          : foodsProvider.food.length > 0
              ? Text(
                  '${foodsProvider.food[0].id}  ${foodsProvider.food[0].calories}')
              : Text("No Item found"),
    );
  }
}
