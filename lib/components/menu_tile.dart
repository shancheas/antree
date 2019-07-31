import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final Function onTap;

  const MenuTile({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          'https://www.whopper.ie/wp-content/uploads/2015/12/BKI-WEB-MAR18_BACONKINGLTO_767x805-Banner-Responsive-F-optimised.jpg'),
      title: Text('Whopper Meal'),
      isThreeLine: true,
      subtitle: Text('+Medium Fries +Medium Drink'),
      trailing: Text(
        'Rp. 54.400',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
