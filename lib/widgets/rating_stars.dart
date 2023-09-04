import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  const RatingStars({super.key, required this.rating});
  @override
  // for( let i =0;){}

  Widget build(BuildContext context) {
    String stars = '';
    for (var i = 0; i < rating; i++) {
      stars += '⭐';
    }
    return Text(
      stars,
      style: TextStyle(fontSize: 20.0, color: Colors.yellow.shade500),
    );
  }
}
