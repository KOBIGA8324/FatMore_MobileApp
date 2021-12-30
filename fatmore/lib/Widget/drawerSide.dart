import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatmore/Screen/about.dart';
import 'package:fatmore/Screen/contact.dart';
import 'package:fatmore/Screen/homeScreen.dart';
import 'package:fatmore/Screen/login.dart';
import 'package:fatmore/Screen/profile.dart';
import 'package:fatmore/Screen/review_cart.dart';
import 'package:fatmore/Screen/wishList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerSide extends StatefulWidget {
  //final UserProvider userProvider;
  // const DrawerSide({required this.userProvider});
//  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  //late UserProvider userProvider;

  Widget listTile(
      {required String title,
      required IconData iconData,
      required VoidCallback onTap}) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          size: 28,
          color: Colors.deepOrange,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _getUserData();
  // }
  //
  // void _getUserData() async {
  //   UserModel userModel;
  //   // var value = FirebaseAuth.instance.currentUser!;
  //   try {
  //     var value = await FirebaseFirestore.instance
  //         .collection('usersData')
  //         .doc(FirebaseAuth.instance.currentUser?.uid)
  //         .get();
  //     if (value.exists) {
  //       userModel = UserModel(
  //         userEmail: value.get("userEmail"),
  //         // userImage: value.get("userImage"),
  //         userName: value.get("userName"),
  //         userUid: value.get("userUid"),
  //       );
  //     }
  //   } catch (e) {
  //     print("something went wrong");
  //   }
  // }
  Widget userData(context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("usersData").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text("Loading data");
          return Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(snapshot.data!.docs[0]['userName']),
                Text(snapshot.data!.docs[0]['userEmail'].toString())
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // var userData = widget.userProvider.currentUserData;

    return Drawer(
      //  backgroundColor: Colors.white,
      child: Container(
        color: Colors.deepOrange.shade300,
        child: ListView(
          children: [
            DrawerHeader(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white54,
                    child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white54,
                        backgroundImage: AssetImage("asset/images/food6.jpg")),
                  ),
                ),
                Container(
                  child: userData(context),
                ),
              ]),
            )),
            // UserAccountsDrawerHeader(
            //     decoration:
            //         BoxDecoration(color: Colors.deepOrange.withOpacity(0.5)),
            //     arrowColor: Colors.black,
            //     currentAccountPicture: CircleAvatar(
            //       backgroundImage: AssetImage("asset/images/food6.jpg"),
            //     ),
            //
            //     accountName: Text(""),
            //     accountEmail: Text("")),
            listTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => HomeScreen()));
              },
              title: ("Home page"),
              iconData: Icons.home,
            ),
            listTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => About()));
              },
              title: ("About"),
              iconData: Icons.info,
            ),
            listTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => ContactUs()));
              },
              iconData: Icons.contact_phone,
              title: ("Contact us"),
            ),
            listTile(
              iconData: Icons.shop,
              title: ("Review_cart"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => ReviewCart()));
              },
            ),
            listTile(
              iconData: Icons.favorite,
              title: ("Wish List"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => WishList()));
              },
            ),
            listTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => Profile(
                        //userProvider: widget.userProvider,
                        )));
              },
              iconData: Icons.person,
              title: ("Profile"),
            ),
            listTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => LoginScreen()));
              },
              iconData: Icons.exit_to_app,
              title: ("Logout"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Connect with us"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("call :"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+94773556342"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("mail :"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Kuna@gmail.com"),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
