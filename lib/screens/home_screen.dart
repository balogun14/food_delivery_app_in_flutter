// import statements
import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/widgets/recent_orders.dart';

import '../widgets/resturants_nearby.dart';

//
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text('Food Delivery'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              'cart  (${currentUser.cart.length})',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0.8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 0.8, color: Theme.of(context).primaryColor)),
                  hintText: 'Search Food or Resturant ',
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  )),
            ),
          ),
          const RecentOrders(),
          const Resturants(),
        ],
      ),
    );
  }
}
