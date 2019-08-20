import 'package:flutter/material.dart';

class PurchaseView extends StatefulWidget {
  @override
  _PurchaseViewState createState() => _PurchaseViewState();
}

class _PurchaseViewState extends State<PurchaseView> {

  Widget paymentDetails(String title, String price) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title),
            Text(price)
          ],
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Confirm Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            //2
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Ticket",
                style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: DefaultTextStyle(
                        style: TextStyle(color: Colors.white),
                        child: Container(
                          color: Colors.green,
                          height: 75,
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('Burger King'),
                                  Text('3 People')
                                ],
                              ),
                              Text('BK 002')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.white,
                        height: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //1
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Order Summary",
                    style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                  ),
                  Text('Add Items',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 2.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('2x', style: TextStyle(color: Colors.blueAccent)),
                      ),
                    ),
                    title: Text("Whopper Meal", style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('108.800'),
                  ),
                  ListTile(
                    leading: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('1x', style: TextStyle(color: Colors.blueAccent)),
                      ),
                    ),
                    title: Text("Mushroom Pizza", style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('98.800'),
                  ),
                ],
              ),
            ),

            //3
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Payment Details",
                style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 2.0,
              child: Column(
                children: <Widget>[
                  paymentDetails('Subtotal', '265.990'),
                  paymentDetails('Discount', '0'),
                  paymentDetails('Service Charge', '0'),
                  paymentDetails('Tax', '265.99'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
