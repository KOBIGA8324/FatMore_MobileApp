import 'package:flutter/material.dart';

import 'homeScreen.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,

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
        //centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "About",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 130.0, vertical: 30),
              child: Image.asset('asset/images/logo.png',
                  width: 60,
                  height: 60,
                  color: Colors.deepOrangeAccent,
                  alignment: Alignment.topLeft),
              // child: Text(
              //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              //   style: TextStyle(fontSize: 18, fontFamily: "Poopins Regular"),
              // ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Whether you’re looking for biryani to feed your desi cravings, soul comforting pizzas and burgers, or even a salad with a cup of chai or coffee, Zomato is the only app you need for the quickest doorstep delivery of your favourites. With over 1.5 million restaurants and 285 million ratings and reviews, discover the best around you in no time – only on the FATMORE app",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins_Bold",
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
