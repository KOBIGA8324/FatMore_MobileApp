import 'package:flutter/material.dart';

import 'homeScreen.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 250,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.deepOrange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "\$50",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              color: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomeScreen(),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Check Out",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 70,
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("asset/images/images.png"),
                    ),
                    title: Row(
                      children: [
                        Text("x1"),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Salad",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "\$50",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
