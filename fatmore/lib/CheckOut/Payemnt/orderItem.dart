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
          Text(e.cartName,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins-Bold",
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),

          // // Text(
          //   e.cartUnit,
          //   style: TextStyle(
          //     color: Colors.grey[600],
          //   ),
          // ),
          Text(
            "\LKR ${e.cartPrice}",
            style: TextStyle(
                color: Colors.grey[600],
                fontFamily: "Poppins-Bold",
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Text("\Quantity: ${e.cartQuantity}",
          style: TextStyle(
              color: Colors.grey[600],
              fontFamily: "Poppins-Bold",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0)),
    );
  }
}
