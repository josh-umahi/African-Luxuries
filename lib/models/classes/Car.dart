import 'package:flutter/material.dart';

import './Luxury.dart';

class Car extends Luxury {
  final String title;
  final String state;
  final String country;
  final int costPrice;
  final String rentingSystem;
  final List<String> images;
  final double ratingOutOf5;
  final int reviewsTotal;

  Car({
    @required this.title,
    @required this.state,
    @required this.country,
    @required this.costPrice,
    this.rentingSystem = "per day",
    @required this.images,
    @required this.ratingOutOf5,
    @required this.reviewsTotal,
  });
}
