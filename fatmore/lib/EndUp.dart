import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen/homeScreen.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);
  Widget listTile({required IconData iconData, required VoidCallback onTap}) {
    return Container(
      // height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          size: 28,
          color: Colors.deepOrange,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,

        body: Padding(
      padding: EdgeInsets.only(top: 70.0),
      child: Container(
        child: Column(children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/end.png"),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Center(child: Text("Get Your food Right away")),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 150),
            child: listTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => HomeScreen()));
              },
              iconData: Icons.home,
            ),
          )
        ]),
      ),
    ));
  }
}
