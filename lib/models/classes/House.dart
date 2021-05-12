import 'package:flutter/material.dart';

class House {
  final String title;
  final String state;
  final String country;
  final int costPerNight;
  final List<String> images;
  final double ratingOutOf5;
  final int reviewsTotal;

  House({
    @required this.title,
    @required this.state,
    @required this.country,
    @required this.costPerNight,
    @required this.images,
    @required this.ratingOutOf5,
    @required this.reviewsTotal,
  });

  String get location {
    return "$state, $country";
  }

  String get displayCostPerNight {
    String costPerNight_withCommas = costPerNight.toString().replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

    return "\$$costPerNight_withCommas per night";
  }

  String get displayReviewsTotal {
    return reviewsTotal == 1
        ? "($reviewsTotal Review)"
        : "($reviewsTotal Reviews)";
  }

  List<Icon> buildRatingsIcon({Color colorOfStars}) {
    List<Icon> ratingsIcon = [];
    int ratingOutOf5_floored = ratingOutOf5.floor();
    bool hasDecimal = (ratingOutOf5_floored != ratingOutOf5);

    for (var i = 0; i < 5; i++) {
      ratingsIcon.add(
        Icon(
          i < ratingOutOf5 ? Icons.star : Icons.star_border,
          size: 19,
          color: colorOfStars,
        ),
      );
    }

    if (hasDecimal) {
      ratingsIcon[ratingOutOf5_floored] = Icon(
        Icons.star_half,
        size: 19,
        color: colorOfStars,
      );
    }

    return ratingsIcon;
  }
} 