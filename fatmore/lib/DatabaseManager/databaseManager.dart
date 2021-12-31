import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseManager extends StatelessWidget {
  const DatabaseManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userData(context);
  }

  Widget userData(context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("usersData").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text("Loading data");
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data!.docs[0]['userName'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins_Bold",
                    fontSize: 16,
                    letterSpacing: 1.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  snapshot.data!.docs[0]['userEmail'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins_Bold",
                    fontSize: 10,
                    letterSpacing: 1.0,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          );
        });
  }
}
