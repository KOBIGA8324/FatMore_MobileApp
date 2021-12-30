import 'package:flutter/material.dart';

import 'homeScreen.dart';

class ContactUs extends StatefulWidget {
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController message = TextEditingController();
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  void vaildation() {
    if (email.text.isEmpty && fullname.text.isEmpty && message.text.isEmpty) {
      scaffold.currentState?.showSnackBar(
        SnackBar(
          content: Text("All Fleid Is Empty"),
        ),
      );
    } else if (fullname.text.isEmpty) {
      scaffold.currentState?.showSnackBar(
        SnackBar(
          content: Text("Full Name Is Empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      scaffold.currentState?.showSnackBar(
        const SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!ContactUs.regExp.hasMatch(email.text)) {
      scaffold.currentState?.showSnackBar(
        const SnackBar(
          content: Text("Email Is Not Vaild"),
        ),
      );
    } else if (message.text.isEmpty) {
      scaffold.currentState?.showSnackBar(
        SnackBar(
          content: Text("Message Is Empty"),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
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
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Contact",
          style: TextStyle(
              color: Colors.deepOrange,
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 40),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    TextFormField(
                      controller: fullname,
                      decoration: InputDecoration(
                        fillColor: Colors.deepOrange.shade100,
                        filled: true,
                        hintText: "Full name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        fillColor: Colors.deepOrange.shade100,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: message,
                      decoration: InputDecoration(
                        fillColor: Colors.deepOrange.shade100,
                        filled: true,
                        hintText: "Message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RaisedButton(
                      onPressed: () {
                        vaildation();
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
