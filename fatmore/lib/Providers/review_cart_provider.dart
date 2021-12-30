import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Model/review_cartModel.dart';
import 'package:flutter/cupertino.dart';

class ReviewCartProvider with ChangeNotifier {
  addReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
    //   required bool isAdd;
    //  var cartUnit,
  }) async {
    FirebaseFirestore.instance.collection("ReviewCart").doc(cartId).set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        //  "cartUnit": cartUnit,
        "isAdd": true,
      },
    );
  }

  List<ReviewCartModel> reviewCartDataList = [];

  getReviewCartData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue =
        await FirebaseFirestore.instance.collection("ReviewCart").get();

    reviewCartValue.docs.forEach(
      (element) {
        ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: element.get("cartId"),
          cartImage: element.get("cartImage"),
          cartName: element.get("cartName"),
          cartPrice: element.get("cartPrice"),
          cartQuantity: element.get("cartQuantity"),
          //  cartUnit: element.get("cartUnit"),
        );
        newList.add(reviewCartModel);
        //reviewCartValue.docs.map((doc) => doc.data()).toList();
        //  newList.add(reviewCartModel);
      },
    );
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }
/*
  List<ReviewCartModel> reviewCartDataList = [];

  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),

        //  cartUnit: element.get("cartUnit"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }*/

//// TotalPrice  ///

  getTotalPrice() {
    double total = 0.0;
    reviewCartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;
    });
    return total;
  }

  updateReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    FirebaseFirestore.instance.collection("ReviewCart").doc(cartId).update(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }

////////////// ReviCartDeleteFunction ////////////
  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance.collection("ReviewCart").doc(cartId).delete();
    notifyListeners();
  }
}
