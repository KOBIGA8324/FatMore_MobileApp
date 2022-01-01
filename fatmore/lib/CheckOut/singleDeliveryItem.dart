import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address1;
  final String address2;
  final String number;
  final String addressType;
  SingleDeliveryItem(
      {required this.title,
      required this.addressType,
      required this.address1,
      required this.address2,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,
                padding: EdgeInsets.all(1),
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(addressType,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins-Bold",
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5)),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.deepOrange.shade100,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address1,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins-Bold",
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.5),
              ),
              Text(
                address2,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins-Bold",
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.5),
              ),
              Text(
                number,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins-Bold",
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
        Divider(
          height: 35,
        ),
      ],
    );
  }
}
