import 'package:african_luxuries/models/classes/House.dart';
import 'package:african_luxuries/screens/details/details.dart';
import 'package:flutter/material.dart';
import 'package:african_luxuries/constants.dart';

class ItemCards extends StatelessWidget {
  final List<House> listOfHouses;

  ItemCards(this.listOfHouses);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          listOfHouses.map((house) => buildItemCard(context, house)).toList(),
    );
  }

  GestureDetector buildItemCard(BuildContext context, House house) {
    return GestureDetector(
      onTap: () => _goToDetailsScreen(context, house),
      child: Container(
        margin: EdgeInsets.only(bottom: 23),
        width: 382,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ourBoxShadow,
              offset: Offset(0, 1),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                house.images[0],
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ourPadding,
                vertical: 11,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house.title,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    house.location,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Row(
                    children: [
                      Row(
                        children: house.buildRatingsIcon(
                          colorOfStars: ourPrimaryColor,
                        ),
                      ),
                      Text(
                        house.displayReviewsTotal,
                        style: Theme.of(context).textTheme.headline2,
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
            ),
          ],
        ),
      ),
    );
  }

  void _goToDetailsScreen(BuildContext context, House house) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Details(house: house)),
    );
  }
}
