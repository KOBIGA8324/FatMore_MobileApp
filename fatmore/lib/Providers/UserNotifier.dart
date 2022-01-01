// import 'dart:collection';
//
// import 'package:fatmore/Screen/user.dart';
// import 'package:flutter/cupertino.dart';
//
// class UserNotifier with ChangeNotifier {
//   List<UserData> _userList = [];
//   late UserData _currentuserData;
//
//   UnmodifiableListView<UserData> get userList =>
//       UnmodifiableListView(_userList);
//   UserData get currentuserData => _currentuserData;
//
//   set userList(List<UserData> userList) {
//     _userList = userList;
//     notifyListeners();
//   }
//
//   set currentuserData(UserData user) {
//     currentuserData = user;
//     notifyListeners();
//   }
//
//   // getUser(UserNotifier userNotifier) async {
//   //   QuerySnapshot snapshot =
//   //       await FirebaseFirestore.instance.collection('usersData').get();
//   //   List<UserData> _userLsit = [];
//   //   snapshot.docs.forEach((document) {
//   //     UserData user = UserData.fromMap(document.data);
//   //     _userLsit.add(user);
//   //   });
//   //   userNotifier.userList = _userLsit;
//   // }
// }
