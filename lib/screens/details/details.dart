import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import '../../models/classes/Luxury.dart';
import '../../screens/booked/booked.dart';

class Details extends StatefulWidget {
  final Luxury luxury;

  Details({this.luxury});

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
    final Luxury luxury = widget.luxury;

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Booked()),
          );
        },
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
                      luxury.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      luxury.location,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Colors.black),
                    ),
                    Row(
                      children: [
                        Row(
                          children: luxury.buildRatingsIcon(
                            colorOfStars: Colors.black,
                          ),
                        ),
                        Text(
                          luxury.displayReviewsTotal,
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
                          luxury.displayCostPrice,
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
          Hero(
            tag: luxury.images[0],
            child: Image.asset(luxury.images[0]),
          ),
          ...luxury.images.sublist(1).map((image) {
            return Image.asset(image);
          }).toList(),
        ],
      ),
    );
  }
}
