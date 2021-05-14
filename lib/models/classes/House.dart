import 'package:flutter/material.dart';

import './Luxury.dart';

class House extends Luxury {
  final String title;
  final String state;
  final String country;
  final int costPrice;
  final String rentingSystem;
  final List<String> images;
  final double ratingOutOf5;
  final int reviewsTotal;

  House({
    @required this.title,
    @required this.state,
    @required this.country,
    @required this.costPrice,
    this.rentingSystem = "per night",
    @required this.images,
    @required this.ratingOutOf5,
    @required this.reviewsTotal,
  });
}
