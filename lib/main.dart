import 'package:african_luxuries/constants.dart';
import 'package:african_luxuries/models/instances.dart';
import 'package:flutter/material.dart';

import 'screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "WorkSans",
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 18,
            color: ourGrey2,
          ),
          headline2: TextStyle(
            fontSize: 16,
            color: ourGrey1,
          ),
          headline3: TextStyle(
            fontFamily: "SquadaOne",
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontFamily: "SquadaOne",
            fontSize: 35,
          ),
        ),
      ),
      home: HomeScreen(
        listOfCountries: listOfCountries,
        listOfLuxuries: listOfLuxuries,
        luxuriesTotal: listOfLuxuries.length,
      ),
    );
  }
}
