import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:page_transition/page_transition.dart';
import 'package:caro/providers/foods.dart';
import 'providers/nutrition_list.dart';
import 'screens/add_entry.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    //statusBarColor: Colors.teal[800],
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NutritionList(),
        ),
        ChangeNotifierProvider.value(
          value: Foods(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Caro',
        theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.amber,
        ),
        home: SplashScreen(),
        routes: {
          //       '/': (ctx) => SplashScreen(),
          AddEntry.routName: (ctx) => AddEntry(),
        },
      ),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caro'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text(
            'Wow, such empty',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: boomMenu(),
    );
  }
}

class boomMenu extends StatelessWidget {
  const boomMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoomMenu(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      //child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      scrollVisible: true,
      overlayColor: Colors.black,
      overlayOpacity: 0.7,
      children: [
        MenuItem(
          child: Hero(
              tag: 'addEntry', child: Icon(Icons.add, color: Colors.white)),
          title: "Add entry",
          titleColor: Colors.white,
          subtitle: "Add meal entry and view food info bitch",
          subTitleColor: Colors.white,
          backgroundColor: Colors.teal[800],
          onTap: () => Navigator.push(
              context,
              PageTransition(
                  child: AddEntry(), type: PageTransitionType.leftToRight)),
        ),
        MenuItem(
          child: Icon(Icons.person, color: Colors.black),
          title: "Profile",
          titleColor: Colors.white,
          subtitle: "View your profile",
          subTitleColor: Colors.white,
          backgroundColor: Colors.teal,
          onTap: () => print('SECOND CHILD'),
        ),
        MenuItem(
          child: Icon(Icons.star, color: Colors.black),
          title: "Rate the App",
          titleColor: Colors.black,
          subtitle: "Leave a rating on the play store",
          subTitleColor: Colors.black,
          backgroundColor: Colors.white,
          onTap: () => print('THIRD CHILD'),
        ),
        MenuItem(
          child: Icon(Icons.keyboard_return, color: Colors.white),
          title: "Logout",
          titleColor: Colors.white,
          subtitle: "Fuck off",
          subTitleColor: Colors.white,
          backgroundColor: Colors.black,
          onTap: () => print('FOURTH CHILD'),
        )
      ],
    );
  }
}

//Column(
//mainAxisAlignment: MainAxisAlignment.start,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//children: <Widget>[
////NutritionKey(),
//Text('FOODS'),
//
//Text('FOODS')
//],
//),
