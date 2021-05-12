import 'package:african_luxuries/models/classes/House.dart';

List<House> listOfHouses = [
  House(
    title: "Hoffman House",
    state: "Lagos",
    country: "Nigeria",
    costPerNight: 12000,
    images: [
      "assets/images/hoff_dp.jpg",
      "assets/images/hoff_1.jpg",
      "assets/images/hoff_2.jpg",
      "assets/images/hoff_3.jpg",
    ],
    ratingOutOf5: 4.5,
    reviewsTotal: 35,
  ),
  House(
    title: "Alumza Palazio",
    state: "Accra",
    country: "Ghana",
    costPerNight: 455657,
    images: [
      "assets/images/alum_dp.jpg",
      "assets/images/alum_1.jpg",
      "assets/images/alum_2.jpg",
      "assets/images/alum_3.jpg",
    ],
    ratingOutOf5: 3.5,
    reviewsTotal: 54,
  ),
  House(
    title: "Pati Blau",
    state: "Cairo",
    country: "Egypt",
    costPerNight: 813,
    images: [
      "assets/images/pati_dp.jpg",
      "assets/images/pati_1.jpg",
      "assets/images/pati_2.jpg",
      "assets/images/pati_3.jpg",
    ],
    ratingOutOf5: 5,
    reviewsTotal: 567,
  ),
  House(
    title: "Satogranade Palace",
    state: "Ebonyi",
    country: "Nigeria",
    costPerNight: 18102,
    images: [
      "assets/images/sato_dp.jpg",
      "assets/images/sato_1.jpg",
      "assets/images/sato_2.jpg",
    ],
    ratingOutOf5: 2.7,
    reviewsTotal: 13,
  ),
];

List<String> listOfCountries = [
  "All",
  ...listOfHouses.map((house) => house.country).toSet().toList()
];
