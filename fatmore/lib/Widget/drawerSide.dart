import 'package:fatmore/DatabaseManager/databaseManager.dart';
import 'package:fatmore/Providers/userProvider.dart';
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
  late UserProvider userProvider;
  late final String uid;
  //final UserProvider userProvider;
  // const DrawerSide({required this.userProvider});
  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
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
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Poppins Regular",
              fontSize: 14,
              letterSpacing: 1.0,
              color: Colors.black,
            )),
      ),
    );
  }

  // Widget userData(context) {
  //   return StreamBuilder<QuerySnapshot>(
  //       stream: FirebaseFirestore.instance.collection("usersData").snapshots(),
  //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //         if (!snapshot.hasData) return Text("Loading data");
  //         return Padding(
  //           padding: const EdgeInsets.only(top: 90.0, left: 20),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Text(snapshot.data!.docs[0]['userName']),
  //               Text(snapshot.data!.docs[0]['userEmail'].toString())
  //             ],
  //           ),
  //         );
  //       });
  // }
  // @override
  // void initState() {
  //   UserNotifier userNotifier = Provider.of(context, listen: false);
  //   UserProvider userProvider = Provider.of(context, listen: false);
  //   userProvider.getUser(userNotifier);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    // userProvider = Provider.of<UserProvider>(context);
    // final user = Provider.of<UserProvider>(context);
    // final uid = user.currentData?.userUid;
    // // final user=FirebaseAuth.instance.currentUser?.uid;
    //
    // DatabaseManager databaseManager = DatabaseManager(
    //   uid: '$uid',
    // );
    // data() async {
    //   dynamic names = await databaseManager.getCurrentUserData();
    //   if (names != null) {
    //     setState(() {
    //       userName = names[0];
    //       print(userName);
    //       userEmail = names[1];
    //     });
    //   }
    // }

    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        // color: Colors.deepOrange.shade200,
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
                        backgroundImage: AssetImage("asset/images/user1.png")),
                  ),
                ),
                Container(
                  child: DatabaseManager(),
                )
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
                  Text(
                    "Connect with us",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins_Bold",
                      fontSize: 14,
                      letterSpacing: 1.0,
                      color: Colors.deepOrange.shade200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("call :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins_Bold",
                            fontSize: 12,
                            letterSpacing: 1.0,
                            color: Colors.black,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+94773556342",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins_Bold",
                            fontSize: 12,
                            letterSpacing: 1.0,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("mail :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins_Bold",
                              fontSize: 12,
                              letterSpacing: 1.0,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Kuna@gmail.com",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins_Bold",
                              fontSize: 12,
                              letterSpacing: 1.0,
                              color: Colors.black,
                            )),
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
