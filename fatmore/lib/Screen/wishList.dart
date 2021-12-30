import 'package:fatmore/Model/wishList_Model.dart';
import 'package:fatmore/Providers/wishListProvider.dart';
import 'package:fatmore/Widget/singleItem_wishList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homeScreen.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late WishListProvider wishListProvider;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  showAlertDialog(BuildContext context, WishListModel delete) {
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
        wishListProvider.wishListDataDelete(delete.wishFoodId);
        //wishListProvider.wishListDataDelete(delete.wishFoodId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you delete on cartProduct?"),
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
    WishListProvider initWishListProvider = Provider.of(context, listen: false);
    initWishListProvider.getWishListData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of<WishListProvider>(context);
    wishListProvider.getWishListData();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("WishList"),
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
      ),
      body: wishListProvider.getWishList.isEmpty
          ? Center(
              child: Text("NO DATA"),
            )
          : ListView.builder(
              itemCount: wishListProvider.getWishList.length,
              itemBuilder: (context, index) {
                WishListModel data = wishListProvider.getWishList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItemWishList(
                      isBool: true,
                      foodImage: data.wishFoodImage,
                      foodName: data.wishFoodName,
                      price: data.price,
                      // foodQuantity: data.foodQuantity,
                      foodId: data.wishFoodId,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                      wishList: true,
                    ),
                  ],
                );
              }

              //children: [

              ),
    );
  }
}
