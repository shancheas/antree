import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  final List<String> imgList;

  const HomeCarousel({Key key, this.imgList}) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  List<Widget> child = List<Widget>();

  @override
  void initState() {
    child = map<Widget>(
      widget.imgList,
      (index, i) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network('http://www.burgerking.com.my/upload/image/offer/79/Double%20King_900pxx480px.png', fit: BoxFit.cover, width: 1000.0, height: 100.0),
          ),
        );
      },
    ).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: child,
        autoPlay: true,
        enlargeCenterPage: false,
        aspectRatio: 3.0,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          widget.imgList,
          (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(255, 255, 255, 0.9)
                      : Color.fromRGBO(255, 255, 255, 0.4)),
            );
          },
        ),
      ),
    ]);
  }
}
