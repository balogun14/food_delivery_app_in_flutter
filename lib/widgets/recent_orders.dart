import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/widgets/resturants_nearby.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  _buildRecentOrder(BuildContext context, Order order) {
    double boxSize = 80;
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 320,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 1.0,
            color: Colors.grey.shade400,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 10,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                order.food.imageUrl,
                height: boxSize,
                width: boxSize,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                order.food.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                order.restaurant.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(
                order.date,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Theme.of(context).primaryColor,
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
    // return Container(
    //   color: Colors.white70,
    //   width: 300,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: <Widget>[
    //       Container(
    //         width: 100,
    //         height: 100,
    //         child: Image.asset(order.food.imageUrl),
    //       ),
    //       Column(
    //         children: [
    //           Text(order.food.name),
    //           Text(order.restaurant.name),
    //           Text(order.date),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          color: Colors.grey.shade50,
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Resturants(),
        )
      ],
    );
  }
}
