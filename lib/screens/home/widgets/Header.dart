import 'package:flutter/material.dart';

import '../../../constants.dart';

class Header extends StatefulWidget {
  final List<String> countryFilterOptions;

  Header({this.countryFilterOptions});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int _selectedCountryFilter = 0;

  Widget build(BuildContext context) {
    List<String> countryFilterOptions = widget.countryFilterOptions;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: ourPadding, top: 95),
      color: ourGrey3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "AN APP BY NIGGAS",
            style: TextStyle(
              fontSize: 12,
              color: ourGrey1,
            ),
          ),
          Text(
            "African Luxuries",
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 48),
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.countryFilterOptions.length,
              itemBuilder: (BuildContext context, int index) =>
                  _buildCountryFilterScroll(
                      context, index, countryFilterOptions[index]),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildCountryFilterScroll(
    BuildContext context,
    int index,
    String country,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCountryFilter = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
        padding: EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
          color:
              _selectedCountryFilter == index ? ourPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: ourBoxShadow,
              blurRadius: 8,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          country,
          style: _selectedCountryFilter == index
              ? TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )
              : Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
