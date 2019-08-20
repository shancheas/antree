import 'package:flutter/material.dart';

class FoodBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Image.network(
        'http://www.burgerking.com.my/upload/image/offer/79/Double%20King_900pxx480px.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
