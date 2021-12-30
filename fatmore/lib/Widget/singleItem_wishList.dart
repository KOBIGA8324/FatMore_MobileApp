import 'package:fatmore/Providers/wishListProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count.dart';

class SingleItemWishList extends StatefulWidget {
  bool isBool = false;
  String foodImage;
  String foodName;
  bool wishList = true;
  int price;
  String foodId;
  //int foodQuantity;
  VoidCallback onDelete;
  // var foodUnit;
  SingleItemWishList(
      {
      //required this.foodQuantity,
      required this.foodId,
      // required this.foodUnit,
      required this.onDelete,
      required this.isBool,
      required this.foodImage,
      required this.foodName,
      required this.price,
      required this.wishList});

  @override
  _SingleItemWishListState createState() => _SingleItemWishListState();
}

class _SingleItemWishListState extends State<SingleItemWishList> {
  late WishListProvider wishListProvider;

  @override
  void initState() {
    WishListProvider initWishListProvider = Provider.of(context, listen: false);
    initWishListProvider.getWishListData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();
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
                          : Text("")
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
