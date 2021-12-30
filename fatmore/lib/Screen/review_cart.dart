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
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you devete on cartProduct?"),
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
        title: Text("Total Aount"),
        subtitle: Text(
          "\$ ${reviewCartProvider.getTotalPrice()}",
          //   "\$ ${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () {},
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
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text("NO DATA"),
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

//  SingleItem1(
//   isBool: true,
//   wishList: false,
//   foodImage: data.cartImage,
//   foodName: data.cartName,
//   price: data.cartPrice,
//   foodId: data.cartId,
//   foodQuantity: data.cartQuantity,
//   // productUnit: data.cartUnit,
//   onDelete: () {
//     showAlertDialog(context, data);
//   },
// ),
