import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'count.dart';

class SingleItems extends StatefulWidget {
  String foodImage;
  String foodName;
  int price;
  bool isBool = false;
  String foodId;
  SingleItems(
      {Key? key,
      required this.isBool,
      required this.foodImage,
      required this.foodId,
      required this.foodName,
      required this.price})
      : super(key: key);

  @override
  State<SingleItems> createState() => _SingleItemsState();
}

class _SingleItemsState extends State<SingleItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  child: Center(
                    child: Image(
                      image: AssetImage(widget.foodImage),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.foodName,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: "Poppins_Bold",
                                fontSize: 14,
                                letterSpacing: 1.0,
                                color: Colors.black),
                          ),
                          Text(
                            "\LKR ${widget.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: "Poppins Regular",
                                fontSize: 14,
                                letterSpacing: 1.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     height: 100,
              //     padding: widget.isBool == false
              //         ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
              //         : EdgeInsets.only(left: 15, right: 15),
              //     child: widget.isBool == false
              //         ? Container(
              //             height: 25,
              //             width: 30,
              //             decoration: BoxDecoration(
              //               border: Border.all(color: Colors.grey),
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //             child: Center(
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Icon(
              //                     Icons.add,
              //                     color: Colors.deepOrange,
              //                   ),
              //                   Text(
              //                     "ADD",
              //                     style: TextStyle(
              //                         color: Colors.deepOrange,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 14),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           )
              //         : Column(
              //             children: [
              //               Icon(
              //                 Icons.delete,
              //                 color: Colors.grey,
              //                 size: 30,
              //               ),
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               Container(
              //                 height: 25,
              //                 width: 70,
              //                 decoration: BoxDecoration(
              //                   border: Border.all(color: Colors.grey),
              //                   borderRadius: BorderRadius.circular(20),
              //                 ),
              //                 child: SingleChildScrollView(
              //                   scrollDirection: Axis.horizontal,
              //                   child: Center(
              //                     child: Row(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       children: [
              //                         Icon(
              //                           Icons.add,
              //                           color: Colors.deepOrange,
              //                         ),
              //                         Text(
              //                           "ADD",
              //                           style: TextStyle(
              //                               color: Colors.deepOrange,
              //                               fontWeight: FontWeight.bold,
              //                               fontSize: 14),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           ),
              //   ),
              // ),
              Count(
                foodName: widget.foodName,
                // foodQuantity: '1',
                foodId: widget.foodId,
                price: widget.price,
                foodImage: widget.foodImage, //foodQuantity: widget.,
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
                color: Colors.grey,
                height: 1,
              )
      ],
    );
  }
}
