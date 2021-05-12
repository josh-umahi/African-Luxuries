import 'package:african_luxuries/constants.dart';
import 'package:african_luxuries/models/classes/House.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Details extends StatefulWidget {
  final House house;

  Details({this.house});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final House house = widget.house;

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          color: ourPrimaryColor,
          height: 90,
          child: Text(
            "Book now",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(ourPadding, 40, ourPadding, 11),
            color: ourPrimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 13),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ourGrey3,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      house.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      house.location,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Colors.black),
                    ),
                    Row(
                      children: [
                        Row(
                          children: house.buildRatingsIcon(
                            colorOfStars: Colors.black,
                          ),
                        ),
                        Text(
                          house.displayReviewsTotal,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          house.displayCostPerNight,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          ...house.images.map((image) {
            return Image.asset(image);
          }).toList(),
        ],
      ),
    );
  }
}
