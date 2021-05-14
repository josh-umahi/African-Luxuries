import 'package:african_luxuries/models/classes/Luxury.dart';
import 'package:african_luxuries/screens/details/details.dart';
import 'package:flutter/material.dart';
import 'package:african_luxuries/constants.dart';

class ItemCards extends StatelessWidget {
  final List<Luxury> listOfLuxuries;

  ItemCards(this.listOfLuxuries);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          listOfLuxuries.map((luxury) => buildItemCard(context, luxury)).toList(),
    );
  }

  GestureDetector buildItemCard(BuildContext context, Luxury luxury) {
    return GestureDetector(
      onTap: () => _goToDetailsScreen(context, luxury),
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
              child: Hero(
                tag: luxury.images[0],
                child: Image.asset(
                  luxury.images[0],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                    luxury.title,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    luxury.location,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Row(
                    children: [
                      Row(
                        children: luxury.buildRatingsIcon(
                          colorOfStars: ourPrimaryColor,
                        ),
                      ),
                      Text(
                        luxury.displayReviewsTotal,
                        style: Theme.of(context).textTheme.headline2,
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
            ),
          ],
        ),
      ),
    );
  }

  void _goToDetailsScreen(BuildContext context, Luxury luxury) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Details(luxury: luxury)),
    );
  }
}
