import 'package:antree/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QueueCard extends StatefulWidget {
  @override
  _QueueCardState createState() => _QueueCardState();
}

class _QueueCardState extends State<QueueCard> {
  DateTime _bookingDate = DateTime.now();
  TimeOfDay _bookingTime = TimeOfDay.now();
  int _customerCount = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _bookingDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _bookingDate) {
      setState(() {
        _bookingDate = picked;
      });
    }
    ;
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _bookingTime,
    );
    if (picked != null && picked != _bookingTime) {
      setState(() {
        _bookingTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DefaultTextStyle(
        style: AntreeThemes.heading,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Number of Customers'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: FloatingActionButton(
                        child: Icon(Icons.remove),
                        heroTag: null,
                        onPressed: () {
                          setState(() {
                            if (_customerCount > 0) _customerCount--;
                          });
                        },
                      ),
                    ),
                    Text('$_customerCount',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    Container(
                      height: 40,
                      child: FloatingActionButton(
                        child: Icon(Icons.add),
                        heroTag: null,
                        onPressed: () {
                          setState(() {
                            _customerCount++;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text('Booking Date'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _InputDropdown(
                      valueText: DateFormat.yMMMd().format(_bookingDate),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 1, child: Text('Booking Time')),
                  Expanded(
                    flex: 1,
                    child: _InputDropdown(
                      valueText: _bookingTime.format(context),
                      onPressed: () {
                        _selectTime(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown({
    Key key,
    this.child,
    this.labelText,
    this.valueText,
    this.valueStyle,
    this.onPressed,
  }) : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(valueText, style: valueStyle),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade700
                  : Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
