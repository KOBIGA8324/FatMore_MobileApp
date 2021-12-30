import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  late final UserModel? currentData;
  addUserData({
    required User currentUser,
    required String userName,
    // required String userImage,
    required String userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        // "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }

  late UserModel _currentData;

  void getUserData() async {
    UserModel userModel;
    // UserModel currentData;
    var value = await FirebaseFirestore.instance
        .collection("usersData")
        .doc(FirebaseAuth.instance.currentUser?.displayName)
        .get();
    if (value.exists) {
      userModel = UserModel(
        userEmail: value.get("userEmail"),
        // userImage: value.get("userImage"),
        userName: value.get("userName"),
        userUid: value.get("userUid"),
      );
      _currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return _currentData;
  }
}

//UserModel currentData;
