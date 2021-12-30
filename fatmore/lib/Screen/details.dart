import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Providers/wishListProvider.dart';
import 'package:fatmore/Screen/review_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homeScreen.dart';

class DetailsScreen extends StatefulWidget {
  final String foodImage;
  final String foodName;
  final String mainIncrediants;
  final int price;
  final String description;
  // final String foodQuantity;
  final String foodId;

  DetailsScreen(
      {Key? key,
      required this.foodImage,
      required this.foodName,
      required this.mainIncrediants,
      required this.price,
      required this.description,
      //required this.foodQuantity,
      required this.foodId})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;

  getWishtListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(widget.foodId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(
                        () {
                          wishListBool = value.get("wishList");
                        },
                      ),
                    }
                }
            });
  }

  @override
  void initState() {
    WishListProvider initWishListProvider = Provider.of(context, listen: false);
    initWishListProvider.getWishListData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishtListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
              backgroundColor: Colors.black,
              color: Colors.deepOrange,
              iconColor: Colors.deepOrange,
              title: "Add To WishList",
              iconData: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                if (wishListBool == true) {
                  wishListProvider.addWishListData(
                    wishFoodId: widget.foodId,
                    wishFoodName: widget.foodName,
                    wishFoodImage: widget.foodImage,
                    price: widget.price,
                    // wishListQuantity: 2,
                  );
                } else {
                  wishListProvider.wishListDataDelete(widget.foodId);
                }
              }
              // }
              ),
          bonntonNavigatorBar(
              backgroundColor: Colors.deepOrange,
              color: Colors.black,
              iconColor: Colors.black,
              title: "Go To Cart",
              iconData: Icons.shop_outlined,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              }),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 20, top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(6),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrangeAccent.withOpacity(0.26)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.foodImage),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.foodName}\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Poppins_Bold",
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "With ${widget.mainIncrediants}",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: "Poppins_Bold",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                  // SizedBox(
                  //   width: 100,
                  // ),
                  Text(
                    "\$${widget.price}",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Poppins_Bold",
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                widget.description, textAlign: TextAlign.justify,
                // "This is full veg salad bowel,it has some popular veggie toppings include chopped carrots, onions, cucumbers, celery, mushrooms and broccoli.",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.69),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "Poppins Regular",
                    letterSpacing: 0.44),
              ),
            ),
            Spacer(),
            /*Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent.withOpacity(0.26),
                          borderRadius: BorderRadius.circular(27)),
                      child: Row(
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Add to Bag",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: "Poppins-Bold"),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                    /*Count(
                        foodName: widget.foodName,
                        foodImage: widget.foodImage,
                        foodId: "sa",
                        foodQuantity: "1",
                        price: widget.price),*/
                  ],
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
