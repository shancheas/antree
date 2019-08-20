import 'package:antree/components/menu_main.dart';
import 'package:antree/model/home_model.dart';
import 'package:antree/components/awesome_background.dart';
import 'package:antree/components/home_carousel.dart';
import 'package:antree/components/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'transaction_view.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> shortcut = [
    {'title': 'Food', 'icon': Icons.local_dining, 'color': Colors.green},
    {'title': 'Drink', 'icon': Icons.local_bar, 'color': Colors.orange},
    {
      'title': 'Bread',
      'icon': Icons.free_breakfast,
      'color': Colors.blueAccent.shade200
    },
    {
      'title': 'Snack',
      'icon': Icons.fastfood,
      'color': Colors.purpleAccent.shade100
    },
    {'title': 'More', 'icon': Icons.more_horiz, 'color': Colors.brown}
  ];

  ScrollController _controller = ScrollController(initialScrollOffset: 0.0);
  Color appBarColor;
  Color iconColor;
  Future<HomeModel> requestHome() async {
    Dio dio = Dio();
    Response response = await dio.post(
        'http://antree.id/apps/Customer_Api/Page1_Initial',
        queryParameters: {'customer_id': '15'});

    return HomeModel.fromJson(response.data);
  }

  @override
  void initState() {
    super.initState();
    appBarColor = Colors.transparent;
    iconColor = Colors.white;
    _controller.addListener(() {
      if (_controller.offset > 75) {
        if (appBarColor != Colors.white) {
          setState(() {
            appBarColor = Colors.white;
            iconColor = Colors.grey.shade400;
          });
        }
      } else {
        if (appBarColor != Colors.transparent) {
          setState(() {
            appBarColor = Colors.transparent;
            iconColor = Colors.white;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        body: Stack(
          fit: StackFit.expand,
          children: [
            AwesomeBackground(),
            FutureBuilder(
                future: requestHome(),
                initialData: null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Slides> slides = snapshot.data.slides;
                    List<Outlets> outlets = snapshot.data.outlets;

                    return CustomScrollView(
                      controller: _controller,
                      slivers: <Widget>[
                        SliverAppBar(
                          pinned: true,
                          backgroundColor: appBarColor,
                          elevation: 0,
                          title: CustomSearchBar(),
                          actions: <Widget>[
                            IconButton(
                              icon: Icon(Icons.notifications, color: iconColor),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.person, color: iconColor),
                              onPressed: () {},
                            )
                          ],
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            HomeCarousel(
                              imgList:
                                  slides.map((slide) => slide.photo).toList(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Card(
                                elevation: 4.0,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 140,
                                        child: FlatButton.icon(
                                            icon: Icon(Icons.attach_money),
                                            label: Text('Rp. 10.000')),
                                      ),
                                      Container(
                                        height: 32,
                                        width: .5,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 140,
                                        child: FlatButton.icon(
                                            icon: Icon(Icons.stars),
                                            label: Text('2.000')),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 75,
                              child: ListView.builder(
                                itemCount: shortcut.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return Center(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
                                      width: 75,
                                      decoration: BoxDecoration(
                                          color: shortcut[index]['color'],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3.0,
                                            ),
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            shortcut[index]['icon'],
                                            color: Colors.white,
                                          ),
                                          Text(
                                            shortcut[index]['title'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ]),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate((_, index) {
                            Outlets outlet = outlets[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TransactionView()),
                                );
                              },
                              child: MenuMain(outlet: outlet),
                            );
                          }, childCount: outlets.length),
                        )
                      ],
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                })
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.favorite),
              title: new Text('Favourites'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory),
                title: Text('Promotion'))
          ],
        ),
      ),
    );
  }
}
