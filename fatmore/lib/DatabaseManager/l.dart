import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<String> data2() async {
      var data1 =
          (await FirebaseFirestore.instance.collection('userData').get())
              .toString();
      return data1;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: ListTile(
                  title: FutureBuilder(
                    future: data2(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      return Text(snapshot.data);
                    },
                  ), //ok no errors.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
