import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentData;

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

  // getUser(UserNotifier userNotifier) async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('usersData').get();
  //   List<UserData> _userLsit = [];
  //   snapshot.docs.forEach((document) {
  //     UserData user = UserData.fromMap(document.get(document));
  //     _userLsit.add(user);
  //   });
  //   userNotifier.userList = _userLsit;
  // }
  //   getInfor() async {
  //     UserModel userModel;
  //     //var value = FirebaseAuth.instance.currentUser!;
  //     try {
  //       var value = await FirebaseFirestore.instance
  //           .collection('usersData')
  //           .doc(FirebaseAuth.instance.currentUser?.uid)
  //           .get();
  //       if (value.exists) {
  //         userModel = UserModel(
  //           userEmail: value.get("userEmail"),
  //           // userImage: value.get("userImage"),
  //           userName: value.get("userName"),
  //           userUid: value.get("userUid"),
  //         );
  //       }
  //     } catch (e) {
  //       print("something went wrong");
  //     }
  //   }
  // }
  // StreamBuilder<QuerySnapshot<Object?>> userData(context) {
  //   return StreamBuilder<QuerySnapshot>(
  //       stream: FirebaseFirestore.instance.collection("usersData").snapshots(),
  //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //         if (!snapshot.hasData) return Text("Loading data");
  //         return Padding(
  //           padding: const EdgeInsets.only(top: 90.0, left: 20),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Text(${snapshot.data!.docs['userName']}'),
  //               Text(snapshot.data!.docs[0]['userEmail'].toString())
  //             ],
  //           ),
  //         );
//     //       });
//   }
//
// //UserModel currentData;
//     List<UserModel> userData = [];
//
//     getUserData() async {
//       List<UserModel> newList = [];
//       QuerySnapshot value =
//       await FirebaseFirestore.instance.collection("usersData").get();
//
//       value.docs.forEach(
//             (element) {
//           UserModel userModel = UserModel(
//             userName: element.get("userName"),
//             userEmail: element.get("userEmail"),
//             userUid: element.get("userUid"),
//           );
//           newList.add(userModel);
//         },
//       );
//       userData = newList;
//       notifyListeners();
//     }
//
//     List<UserModel> get  {
//       return userData;
//     }
//   }

}
