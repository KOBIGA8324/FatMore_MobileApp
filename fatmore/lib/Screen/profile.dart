import 'package:fatmore/Widget/drawerSide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  // late UserProvider userProvider;
  // //UserProvider userProvider;
  // Profile({required this.userProvider});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //const Profile({Key? key}) : super(key: key);
  Widget listTile(IconData icon, String title) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
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
                                  Text(
                                    "kokok",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "knknk",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
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
                    listTile(Icons.shop_2_outlined, "My order"),
                    listTile(Icons.location_on_outlined, "My Delivery Address"),
                    listTile(Icons.person_outline, "Refer A Friends"),
                    listTile(Icons.file_copy_outlined, "Terms & Conditions"),
                    listTile(Icons.policy_outlined, "Privacy Policy"),
                    listTile(Icons.add_chart, "About"),
                    listTile(Icons.exit_to_app_outlined, "Log Out"),
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
                backgroundImage: AssetImage("asset/images/images.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
