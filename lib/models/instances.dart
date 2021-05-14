import './classes/Car.dart';
import './classes/House.dart';
import './classes/Luxury.dart';

List<Luxury> listOfLuxuries = [
  House(
    title: "Hoffman House",
    state: "Lagos",
    country: "Nigeria",
    costPrice: 12000,
    images: [
      "assets/images/hoff_dp.jpg",
      "assets/images/hoff_1.jpg",
      "assets/images/hoff_2.jpg",
      "assets/images/hoff_3.jpg",
    ],
    ratingOutOf5: 4.5,
    reviewsTotal: 35,
  ),
  Car(
    title: "Bugatti Mustafi",
    state: "Nairobi",
    country: "Kenya",
    costPrice: 825099,
    images: [
      "assets/images/buga_dp.jpg",
      "assets/images/buga_1.jpg",
      "assets/images/buga_2.jpg",
    ],
    ratingOutOf5: 5,
    reviewsTotal: 1,
  ),
  House(
    title: "Alumza Palazio",
    state: "Accra",
    country: "Ghana",
    costPrice: 455657,
    images: [
      "assets/images/alum_dp.jpg",
      "assets/images/alum_1.jpg",
      "assets/images/alum_2.jpg",
      "assets/images/alum_3.jpg",
    ],
    ratingOutOf5: 3.5,
    reviewsTotal: 54,
  ),
  Car(
    title: "Rolls Royce Ghost",
    state: "Ashanti",
    country: "Ghana",
    costPrice: 7900,
    images: [
      "assets/images/royc_dp.jpg",
      "assets/images/royc_2.jpg",
      "assets/images/royc_1.jpg",
      "assets/images/royc_3.jpg",
    ],
    ratingOutOf5: 4,
    reviewsTotal: 77,
  ),
  House(
    title: "Pati Blau",
    state: "Cairo",
    country: "Egypt",
    costPrice: 813,
    images: [
      "assets/images/pati_dp.jpg",
      "assets/images/pati_1.jpg",
      "assets/images/pati_2.jpg",
      "assets/images/pati_3.jpg",
    ],
    ratingOutOf5: 2,
    reviewsTotal: 567,
  ),
  House(
    title: "Satogranade Palace",
    state: "Ebonyi",
    country: "Nigeria",
    costPrice: 18102,
    images: [
      "assets/images/sato_dp.jpg",
      "assets/images/sato_1.jpg",
      "assets/images/sato_2.jpg",
    ],
    ratingOutOf5: 3.7,
    reviewsTotal: 13,
  ),
];

List<String> listOfCountries = [
  "All",
  ...listOfLuxuries.map((house) => house.country).toSet().toList(growable: false)
];
