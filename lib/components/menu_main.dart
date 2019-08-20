import 'package:antree/model/home_model.dart';
import 'package:flutter/material.dart';

class MenuMain extends StatelessWidget {
  final Outlets outlet;

  const MenuMain({Key key, this.outlet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.network(
                  'http://www.burgerking.com.my/upload/image/offer/79/Double%20King_900pxx480px.png'),
              SizedBox(height: 75)
            ],
          ),
          DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(outlet.outletName),
                      SizedBox(
                        height: 5,
                      ),
                      Text('1km • Address'),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding:
                            EdgeInsets.symmetric(
                                horizontal: 8),
                            color: Colors.red,
                            child: Text('open'),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text('09:00 - 21:00')
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Waiting'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('00',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight:
                              FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text('0 min')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
