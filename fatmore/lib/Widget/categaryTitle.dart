import 'package:fatmore/CheckOut/deliveryDeatils.dart';
import 'package:fatmore/Screen/homeScreen_breakfast.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;
  //final VoidCallback onTap;
  CategoryTitle({
    Key? key,
    this.active = false,
    //  required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 10),
      child: TextButton(
        onPressed: () {
          if (title == "Breakfast") {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Breakfast(),
              ),
            );
          }
          if (title == "Lunch") {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DeliveryDetails(),
              ),
            );
          }
          if (title == "Dinner") {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DeliveryDetails(),
              ),
            );
          }
          if (title == "Snacks") {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DeliveryDetails(),
              ),
            );
          }
        },
        child: Text(
          title,
          style: TextStyle(
              color: active ? Colors.deepOrangeAccent : Colors.grey,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
