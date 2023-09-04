import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';

import '../models/food.dart';
import '../widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image.asset(
                  widget.restaurant.imageUrl,
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // print('Clicked');
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        size: 35.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text('0.2  miles away'),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: RatingStars(rating: widget.restaurant.rating),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              widget.restaurant.address,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
                width: 150.0,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepOrange),
                  ),
                  child: const Text(
                    'Reviews',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 150.0,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepOrange),
                  ),
                  child: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              // crossAxisSpacing: 9.0,
              // mainAxisSpacing: 19.0,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          food.imageUrl,
                          width: 170,
                          height: 170,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            food.name,
                            style: const TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "\$${food.price}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0,left: 100.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: CircleAvatar(
                                radius:20.0,
                                backgroundColor:Theme.of(context).primaryColor,
                                child: const Icon(Icons.add,color: Colors.white,),
                              ), onPressed: () {  },
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
