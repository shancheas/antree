import 'package:flutter/material.dart';

class PaymentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Payment'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Card(
                  child: Container(
                    width: 75,
                    height: 30,
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Text('CASH',
                          style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                ),
                title: Text("Cash",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.check, color: Colors.green,),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Card(
                  child: Container(
                    width: 75,
                    height: 30,
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Text('OVO',
                          style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                ),
                title: Text("Rp. 328.500,-",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Card(
                  child: Container(
                    width: 75,
                    height: 30,
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Text('GOPAY',
                          style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                ),
                title: Text("Rp. 40.500",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ),
            ),
            SizedBox(height: 30,),
            Container(
                width: double.infinity,
                color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Change Payment Method',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
