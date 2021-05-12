import 'package:african_luxuries/constants.dart';
import 'package:african_luxuries/models/classes/House.dart';
import 'package:african_luxuries/screens/home/widgets/Header.dart';
import 'package:african_luxuries/screens/home/widgets/ItemCards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<String> listOfCountries;
  final List<House> listOfHouses;
  final int housesTotal;

  HomeScreen({this.listOfCountries, this.listOfHouses, this.housesTotal});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String targetCountry;
  List<House> listOfHouses;
  int housesTotal;

  @override
  Widget build(BuildContext context) {
    targetCountry = "All";
    listOfHouses = widget.listOfHouses;
    housesTotal = widget.housesTotal;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(countryFilterOptions: widget.listOfCountries, targetCountry: targetCountry,),
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
                    ItemCards(filterByCountry(luxuryList, targetCountry)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void filterByCountry(List<House> luxuryList, String targetCountry) {
    if (targetCountry == "All") {
      listOfHouses = new List.from(luxuryList);
      return;
    }
    setState(() {
      listOfHouses =
          luxuryList.where((luxuryItem) => luxuryItem.country == targetCountry).toList();
    });
  }

  String displayTotal(int total) {
    return total == 1 ? "$total property found" : "$total properties found";
  }
}
