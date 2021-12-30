import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Model/wishList_Model.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  addWishListData({
    required String wishFoodId,
    required String wishFoodImage,
    required String wishFoodName,
    required int price,
    // required int wishListQuantity,
  }) {
    FirebaseFirestore.instance.collection("WishList").doc(wishFoodId).set({
      "wishFoodId": wishFoodId,
      "wishFoodName": wishFoodName,
      "wishFoodImage": wishFoodImage,
      "price": price,
      // "wishListQuantity": wishListQuantity,
      "wishList": true,
    });
  }

  ///// Get WishList Data ///////
  List<WishListModel> wishDataList = [];

  getWishListData() async {
    List<WishListModel> newList = [];
    QuerySnapshot wishListvalue =
        await FirebaseFirestore.instance.collection("WishList").get();
    wishListvalue.docs.forEach(
      (element) {
        WishListModel wishListModel = WishListModel(
          wishFoodId: element.get("wishFoodId"),
          wishFoodImage: element.get("wishFoodImage"),
          wishFoodName: element.get("wishFoodName"),
          price: element.get("price"),
          // foodQuantity: element.get("wishListQuantity"),
        );
        newList.add(wishListModel);
      },
    );
    wishDataList = newList;
    notifyListeners();
  }

  List<WishListModel> get getWishList {
    return wishDataList;
  }

////////// Delete WishList /////
  wishListDataDelete(wishFoodId) {
    FirebaseFirestore.instance.collection("WishList").doc(wishFoodId).delete();
    notifyListeners();
  }
}
