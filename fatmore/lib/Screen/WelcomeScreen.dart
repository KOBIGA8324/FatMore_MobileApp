import 'package:fatmore/Screen/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("asset/images/background.png"),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                const Text(
                  "Welcome to Fatmore",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FORTE",
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 3.0),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "- Good - ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "FOOD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontFamily: "Roboto",
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "is",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "GOOD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontFamily: "Roboto",
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.favorite,
                            color: Colors.deepOrangeAccent,
                            size: 12,
                          ),
                          Text(
                            "Mood  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.deepOrangeAccent,
                            size: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    // decoration: BoxDecoration(
                    //    border: Border.all(color: Colors.blueAccent)),
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
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
                    SizedBox(
                      width: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignInScreen()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      color: Colors.deepOrangeAccent,
                    )
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
