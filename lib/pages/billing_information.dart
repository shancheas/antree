import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'home_view.dart';

class BillingInformation extends StatefulWidget {
  @override
  _BillingInformationState createState() => _BillingInformationState();
}

class _BillingInformationState extends State<BillingInformation> {
  Widget paymentDetails(String title, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(title), Text(price)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
                          height: 85,
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Burger King'),
                                  Text('Booking'),
                                  Text('3 People')
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Ticket Number'),
                                  Text(
                                    'BK002',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.white,
                        height: 85,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: <Widget>[
                            Text(DateFormat.yMd().format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.access_time),
                                Text(DateFormat.Hm().format(DateTime.now()))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //1
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Order Summary",
                style: TextStyle(
                    color: Colors.grey.shade700, fontWeight: FontWeight.bold),
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
                        child: Text('2x',
                            style: TextStyle(color: Colors.blueAccent)),
                      ),
                    ),
                    title: Text("Whopper Meal",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('108.800'),
                  ),
                  ListTile(
                    leading: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('1x',
                            style: TextStyle(color: Colors.blueAccent)),
                      ),
                    ),
                    title: Text("Mushroom Pizza",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('98.800'),
                  ),
                ],
              ),
            ),

            //4
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Payment Details",
                style: TextStyle(
                    color: Colors.grey.shade700, fontWeight: FontWeight.bold),
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

            //4
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Payment Method",
                style: TextStyle(
                    color: Colors.grey.shade700, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 2.0,
              child: Column(
                children: <Widget>[
                  paymentDetails('Pay Ammount', '300.000'),
                  paymentDetails('Change', '34.010'),
                  paymentDetails('Served By', 'Jhon'),
                  paymentDetails('Chasier', 'Meghan'),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context) => HomePage()), (Route<dynamic> route) => false);
                      },
                      child: Text('Home'),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text('Testimonial'),
                      color: Colors.orange,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
