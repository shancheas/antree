import 'package:antree/components/food_banner.dart';
import 'package:antree/components/queue_card.dart';
import 'package:antree/themes.dart';
import 'package:flutter/material.dart';

import 'menus_view.dart';

class TransactionView extends StatefulWidget {
  @override
  _TransactionViewState createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: menus.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QUEUE'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          FoodBanner(),
          Container(
            decoration:
                new BoxDecoration(color: Theme.of(context).primaryColor),
            child: new TabBar(
              controller: _controller,
              tabs: menus.map((Menus menu) {
                return Tab(
                  text: menu.title,
                  icon: Icon(menu.icon),
                );
              }).toList(),
            ),
          ),
          QueueCard()
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 60,
        child: RaisedButton(
          color: Colors.blue,
          child: Text('CONFIRM BOOK', style: AntreeThemes.confirmTextStyle),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MenusView()
              )
            );
          },
        ),
      ),
    );
  }
}

class Menus {
  const Menus({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Menus> menus = const <Menus>[
  const Menus(title: 'BOOKING', icon: Icons.directions_car),
  const Menus(title: 'DINE - IN', icon: Icons.directions_bike),
  const Menus(title: 'TAKE AWAY', icon: Icons.directions_boat),
  const Menus(title: 'DELIVERY', icon: Icons.directions_bus),
];
