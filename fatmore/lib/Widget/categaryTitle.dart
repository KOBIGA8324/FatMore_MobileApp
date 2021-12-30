import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final bool actrive;
  const CategoryTitle({
    Key? key,
    this.actrive = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 10),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
              color: actrive ? Colors.deepOrangeAccent : Colors.grey,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
