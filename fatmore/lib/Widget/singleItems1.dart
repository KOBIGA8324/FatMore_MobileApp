import 'package:fatmore/Providers/review_cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count.dart';

class SingleItem1 extends StatefulWidget {
  bool isBool = false;
  String foodImage;
  String foodName;
  bool wishList = false;
  int price;
  String foodId;
  int foodQuantity;
  VoidCallback onDelete;
  // var foodUnit;
  SingleItem1(
      {required this.foodQuantity,
      required this.foodId,
      // required this.foodUnit,
      required this.onDelete,
      required this.isBool,
      required this.foodImage,
      required this.foodName,
      required this.price,
      required this.wishList});

  @override
  _SingleItem1State createState() => _SingleItem1State();
}

class _SingleItem1State extends State<SingleItem1> {
  late ReviewCartProvider reviewCartProvider;

  late int count;
  getCount() {
    setState(() {
      count = widget.foodQuantity;
    });
  }

  @override
  void initState() {
    ReviewCartProvider initReviewProvider = Provider.of(context, listen: false);
    initReviewProvider.getReviewCartData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  child: Center(
                    child: Image(image: AssetImage(widget.foodImage)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "${widget.price}\$",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? GestureDetector(
                              // onTap: () {
                              //   showModalBottomSheet(
                              //       context: context,
                              //       builder: (context) {
                              //         return Column(
                              //           mainAxisSize: MainAxisSize.min,
                              //           children: <Widget>[
                              //             ListTile(
                              //               title: new Text('1'),
                              //               onTap: () {
                              //                 Navigator.pop(context);
                              //               },
                              //             ),
                              //             ListTile(
                              //               title: new Text('2'),
                              //               onTap: () {
                              //                 Navigator.pop(context);
                              //               },
                              //             ),
                              //             ListTile(
                              //               title: new Text('3'),
                              //               onTap: () {
                              //                 Navigator.pop(context);
                              //               },
                              //             ),
                              //           ],
                              //         );
                              //       });
                              // },
                              // child: Container(
                              //   margin: EdgeInsets.only(right: 15),
                              //   padding: EdgeInsets.symmetric(horizontal: 10),
                              //   height: 35,
                              //   decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.black),
                              //     borderRadius: BorderRadius.circular(30),
                              //   ),
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         child: Text(
                              //           "1",
                              //           style: TextStyle(
                              //             color: Colors.grey,
                              //             fontSize: 14,
                              //           ),
                              //         ),
                              //       ),
                              //       Center(
                              //         child: Icon(
                              //           Icons.arrow_drop_down,
                              //           size: 20,
                              //           color: Colors.black,
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              )
                          : Text("${widget.foodQuantity}")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Count(
                          foodId: widget.foodId,
                          foodImage: widget.foodImage,
                          foodName: widget.foodName,
                          price: widget.price,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: widget.onDelete,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              widget.wishList == false
                                  ? Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (count == 1) {
                                                  //Fluttertoast.showToast(
                                                  //  msg:
                                                  //  "You reach minimum limit",

                                                  // );
                                                } else {
                                                  setState(() {
                                                    count--;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                    cartId: widget.foodId,
                                                    cartImage: widget.foodImage,
                                                    cartName: widget.foodName,
                                                    cartPrice: widget.price,
                                                    cartQuantity: count,
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              "$count",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (count < 10) {
                                                  setState(() {
                                                    count++;
                                                  });

                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                    cartId: widget.foodId,
                                                    cartImage: widget.foodImage,
                                                    cartName: widget.foodName,
                                                    cartPrice: widget.price,
                                                    cartQuantity: count,
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black45,
              )
      ],
    );
  }
}
