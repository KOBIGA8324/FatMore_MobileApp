import 'package:carousel_pro/carousel_pro.dart';
import 'package:fatmore/Screen/WelcomeScreen.dart';
import 'package:flutter/material.dart';

class SkipScreen extends StatelessWidget {
  const SkipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Carousel(
              //animationDuration: Duration(seconds: 2),
              autoplay: true,
              boxFit: BoxFit.cover,
              dotBgColor: Colors.transparent,
              dotIncreasedColor: Colors.deepOrange,
              dotSize: 7,
              images: [
                AssetImage("asset/images/food.png"),
                AssetImage("asset/images/skipScreen/food1.png"),
                AssetImage("asset/images/skipScreen/imageslider3.jpg"),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const WelcomeScreen()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: Colors.deepOrange.shade300,
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
