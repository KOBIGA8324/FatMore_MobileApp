import 'package:fatmore/CheckOut/deliveryDeatils.dart';
import 'package:fatmore/Model/review_cartModel.dart';
import 'package:fatmore/Providers/review_cart_provider.dart';
import 'package:fatmore/Widget/singleItems1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homeScreen.dart';

class ReviewCart extends StatefulWidget {
  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  late ReviewCartProvider reviewCartProvider;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "No",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins_Bold",
            fontSize: 15,
            letterSpacing: 1.0),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Yes",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins_Bold",
            fontSize: 15,
            letterSpacing: 1.0),
      ),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Cart Product",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins_Bold",
            fontSize: 18,
            color: Colors.deepOrange,
            letterSpacing: 1.0),
      ),
      content: Text(
        "Are you delete on cartProduct?",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins_Bold",
            fontSize: 16,
            letterSpacing: 1.0),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    ReviewCartProvider initReviewProvider = Provider.of(context, listen: false);
    initReviewProvider.getReviewCartData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins_Bold",
              fontSize: 12,
              letterSpacing: 1.0,
              color: Colors.black),
        ),
        subtitle: Text(
          "\ LKR ${reviewCartProvider.getTotalPrice()}",

          //"\$ ${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(
            color: Colors.green[900],
            fontFamily: "Poppins_Bold",
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text(
              "Submit",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins_Bold",
                  fontSize: 16,
                  letterSpacing: 2.0),
            ),
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () {
              reviewCartProvider.getReviewCartDataList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("Please make sure your orders")],
                      ),
                    )

                  // if (reviewCartProvider.getReviewCartDataList.isEmpty) {
                  //   return Fluttertoast.showToast(msg: "No Cart Data Found");
                  // }
                  : Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DeliveryDetails(),
                      ),
                    );
            },
            /*onPressed: () {
              if (reviewCartProvider.getReviewCartDataList.isEmpty) {
               // return Fluttertoast.showToast(msg: "No Cart Data Found");
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DeliveryDetails(),
                ),
              );
            },*/
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Review Cart",
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Poppins_Bold",
              fontSize: 18,
              letterSpacing: 1.0,
              color: Colors.black),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  "NO DATA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins_Bold",
                      fontSize: 14,
                      letterSpacing: 1.0,
                      color: Colors.deepOrange),
                ),
              ),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem1(
                      isBool: true,
                      wishList: false,
                      foodImage: data.cartImage,
                      foodName: data.cartName,
                      price: data.cartPrice,
                      foodId: data.cartId,
                      foodQuantity: data.cartQuantity,
                      // productUnit: data.cartUnit,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
