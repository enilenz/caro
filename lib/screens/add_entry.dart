import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

class AddEntry extends StatefulWidget {
  static const routName = '/addEntry';

  @override
  _AddEntryState createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  bool isSearching = false;

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
        body: Center(
          child: Text('add entry'),
        ));
  }
}
