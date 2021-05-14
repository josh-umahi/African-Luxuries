import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/classes/Luxury.dart';
import '../../screens/home/widgets/Header.dart';
import '../../screens/home/widgets/ItemCards.dart';

class HomeScreen extends StatefulWidget {
  final List<String> listOfCountries;
  final List<Luxury> listOfLuxuries;
  final int luxuriesTotal;

  HomeScreen({this.listOfCountries, this.listOfLuxuries, this.luxuriesTotal});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String targetCountry;
  List<Luxury> listOfLuxuries;
  int luxuriesTotal;

  @override
  void initState() {
    filterByCountry();
    super.initState();
  }

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
              Header(
                  countryFilterOptions: widget.listOfCountries,
                  onClickFilter: filterByCountry),
              Padding(
                padding: EdgeInsets.all(ourPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayTotal(luxuriesTotal),
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 23),
                    ItemCards(listOfLuxuries),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void filterByCountry({String newTargetCountry = "All"}) {
    setState(() {
      targetCountry = newTargetCountry;
      if (newTargetCountry == "All") {
        listOfLuxuries = new List.from(widget.listOfLuxuries);
      } else {
        listOfLuxuries = widget.listOfLuxuries.where((luxury) {
          return luxury.country == newTargetCountry;
        }).toList();
      }
    });
    luxuriesTotal = listOfLuxuries.length;
  }

  String displayTotal(int total) {
    return total == 1 ? "$total property found" : "$total properties found";
  }
}
