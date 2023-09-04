import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/widgets/rating_stars.dart';

import '../screens/restaurant_screen.dart';

class Resturants extends StatefulWidget {
  const Resturants({super.key});

  @override
  State<Resturants> createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {
  _buildNearbyResturants() {
    List<Widget> restaurantList = [];
    for (var restaurant in restaurants) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantScreen(restaurant: restaurant),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey.shade200)),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: restaurant.imageUrl,
                child: Image.asset(
                  restaurant.imageUrl,
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                RatingStars(rating: restaurant.rating),
                Text(
                  restaurant.address,
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  '0.2 miles away',
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
          ]),
        ),
      ));
    }
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Nearby Restaurants',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildNearbyResturants()
      ],
    );
  }
}
