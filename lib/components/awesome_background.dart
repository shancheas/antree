import 'package:flutter/material.dart';

import 'tools/arc_clipper.dart';

class AwesomeBackground extends StatelessWidget {
  final image;
  AwesomeBackground({this.image});

  Widget topHalf(BuildContext context) {
    return new Flexible(
      flex: 2,
      child: ClipPath(
        clipper: new ArcClipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                colors: [Colors.blue.shade800, Colors.blue],
              )),
            ),
            Container(
                width: double.infinity,
                child: image != null
                    ? Image.network(
                        image,
                        fit: BoxFit.cover,
                      )
                    : new Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 3,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
