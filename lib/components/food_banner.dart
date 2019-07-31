import 'package:flutter/material.dart';

class FoodBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Image.network(
        'https://i.ytimg.com/vi/Nq896-sPDrc/maxresdefault.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
