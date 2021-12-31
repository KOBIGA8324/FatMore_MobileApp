import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Providers/review_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  String foodName;
  String foodImage;
  String foodId;
  int price;
  //var productUnit;

  Count({
    required this.foodName,
    // this.productUnit,
    required this.foodId,
    required this.foodImage,
    required this.price,
  });
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(widget.foodId)
        .get()
        .then(
          (value) => {
            if (this.mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      count = value.get("cartQuantity");
                      isTrue = value.get("isAdd");
                    })
                  }
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();

    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      reviewCartProvider.reviewCartDataDelete(widget.foodId);
                    } else if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.updateReviewCartData(
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
                    size: 15,
                    color: Color(0xffd0b84c),
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                    color: Color(0xffd0b84c),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    reviewCartProvider.updateReviewCartData(
                      cartId: widget.foodId,
                      cartImage: widget.foodImage,
                      cartName: widget.foodName,
                      cartPrice: widget.price,
                      cartQuantity: count,
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Color(0xffd0b84c),
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.foodId,
                    cartImage: widget.foodImage,
                    cartName: widget.foodName,
                    cartPrice: widget.price,
                    cartQuantity: count,
                    //  cartUnit: widget.productUnit,
                  );
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ),
    );
  }
}
