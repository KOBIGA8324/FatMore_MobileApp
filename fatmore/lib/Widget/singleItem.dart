import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItems extends StatefulWidget {
  String foodImage;
  String foodName;
  int price;
  bool isBool = false;
  SingleItems(
      {Key? key,
      required this.isBool,
      required this.foodImage,
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
                          Text(widget.foodName),
                          Text("${widget.price}\$"),
                        ],
                      ),
                      // widget.isBool == false
                      //     ? Container(
                      //         margin: EdgeInsets.only(right: 10),
                      //         padding: EdgeInsets.symmetric(horizontal: 10),
                      //         height: 35,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(color: Colors.grey),
                      //           borderRadius: BorderRadius.circular(20),
                      //         ),
                      //         child: Row(
                      //           children: [
                      //             Expanded(
                      //               child: Text(
                      //                 "+1",
                      //                 style: TextStyle(
                      //                     color: Colors.grey, fontSize: 14),
                      //               ),
                      //             ),
                      //             Center(
                      //               child: Icon(Icons.arrow_drop_down),
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     : Text("+1"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Container(
                          height: 25,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.deepOrange,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.deepOrange,
                                      ),
                                      Text(
                                        "ADD",
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                ),
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
