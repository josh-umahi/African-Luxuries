import 'package:african_luxuries/constants.dart';
import 'package:african_luxuries/models/classes/House.dart';
import 'package:african_luxuries/screens/home/widgets/Header.dart';
import 'package:african_luxuries/screens/home/widgets/ItemCards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> listOfCountries;
  final List<House> listOfHouses;
  final int housesTotal;

  HomeScreen({this.listOfCountries, this.listOfHouses, this.housesTotal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(countryFilterOptions: listOfCountries),
              Padding(
                padding: EdgeInsets.all(ourPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayTotal(housesTotal),
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 23),
                    ItemCards(listOfHouses),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String displayTotal(int total) {
    return total == 1 ? "$total property found" : "$total properties found";
  }
}
