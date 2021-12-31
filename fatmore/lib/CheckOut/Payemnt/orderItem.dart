import 'package:fatmore/Model/review_cartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModel e;
  const OrderItem({required this.e});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(e.cartImage),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          // // Text(
          //   e.cartUnit,
          //   style: TextStyle(
          //     color: Colors.grey[600],
          //   ),
          // ),
          Text(
            "\$${e.cartPrice}",
          ),
        ],
      ),
      subtitle: Text(e.cartQuantity.toString()),
    );
  }
}
