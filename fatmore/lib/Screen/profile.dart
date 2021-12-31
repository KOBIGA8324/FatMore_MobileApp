import 'package:fatmore/CheckOut/AddDeliveryDetails/addDelivery_addreese.dart';
import 'package:fatmore/DatabaseManager/databaseManager.dart';
import 'package:fatmore/Screen/review_cart.dart';
import 'package:fatmore/Widget/drawerSide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  // late UserProvider userProvider;
  // //UserProvider userProvider;
  // Profile({required this.userProvider});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //const Profile({Key? key}) : super(key: key);
  Widget listTile(
      {required String title,
      required IconData iconData,
      required VoidCallback onTap}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          onTap: onTap,
          leading: Icon(iconData),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //  var userData = widget.userProvider.currentUserData;

    return Scaffold(
      backgroundColor: Colors.deepOrange.shade300,
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
        //leading: Icon(Icons.menu, color: Colors.green),
        elevation: 0.0,
        backgroundColor: Colors.deepOrange.shade300,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "My Profile",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins-Bold",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
        ),
      ),
      endDrawer: DrawerSide(

          // userProvider: widget.userProvider,
          ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.deepOrange.shade300,
              ),
              Container(
                height: 411,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 200,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DatabaseManager(),
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.deepOrange.shade300,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => HomeScreen()));
                        },
                        title: ("My Order"),
                        iconData: Icons.shop_outlined),
                    listTile(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => ReviewCart()));
                        },
                        title: ("My Delivery Address"),
                        iconData: Icons.location_on_outlined),
                    listTile(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => AddDeliveryAddress()));
                        },
                        title: ("Refer A Friends"),
                        iconData: Icons.person_outline_outlined),
                    listTile(
                        onTap: () {
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (ctx) => HomeScreen()));
                        },
                        title: ("Terms & Condition"),
                        iconData: Icons.file_copy_outlined),
                    listTile(
                        onTap: () {
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (ctx) => HomeScreen()));
                        },
                        title: ("Privacy Policy"),
                        iconData: Icons.policy_outlined),
                    listTile(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => LoginScreen()));
                        },
                        title: ("Logout"),
                        iconData: Icons.exit_to_app_outlined),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepOrange.shade300,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("asset/images/user1.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
