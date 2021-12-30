import 'package:fatmore/Screen/signIn.dart';
import 'package:fatmore/Services/authendicationServices.dart';
import 'package:fatmore/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool isloading = false;
  bool _isObscure = true;
  // String validateEmail = "Please enter valid email";
  RegExp regExp = RegExp(SignInScreen.pattern);

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: isloading
          ? Center(
              child: Container(
                height: 20,
                width: 20,
                //  color: Colors.deepOrangeAccent,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/images/food6.jpg"),
                        //fit: BoxFit.cover,
                        //alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Icon(
                                    Icons.alternate_email,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                        errorText: _validate1
                                            ? 'Email address Can\'t Be Empty'
                                            : _validate3
                                                ? 'Enter valid email'
                                                : null,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.white.withOpacity(0.3),
                                        )),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15),
                                        border: InputBorder.none,
                                        hintText: "Email Address",
                                        hintStyle: InputText),
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(
                                  Icons.lock,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _password,
                                  obscureText: _isObscure,

                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      ),
                                      errorText: _validate2
                                          ? 'Password Can\'t Be Empty'
                                          : null,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.3),
                                      )),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: InputText),

                                  style: TextStyle(color: Colors.white),
                                  //  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: RaisedButton(
                                  onPressed: () {
                                    if (_email.text.isNotEmpty &&
                                        _password.text.isNotEmpty) {
                                      setState(() {
                                        // _password.text. = false;
                                        isloading = true;
                                      });
                                      LogIn(
                                        _email.text,
                                        _password.text,
                                      ).then((user) {
                                        if (user != null) {
                                          setState(() {
                                            isloading = false;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        HomeScreen()));
                                          });
                                          print("Login success");
                                        } else {
                                          print(" Login failed");
                                          setState(() {
                                            isloading = false;
                                          });
                                        }
                                      });
                                    } else {
                                      print("Please fill the form correctly");
                                    }
                                    setState(() {
                                      if (_email.text.isEmpty) {
                                        _validate1 = true;
                                      } else if (!regExp
                                          .hasMatch(_email.text)) {
                                        _validate3 = true;
                                      } else {
                                        _validate1 = false;
                                      }

                                      if (_password.text.isEmpty) {
                                        _validate2 = true;
                                      } else {
                                        _validate2 = false;
                                      }
                                    });
                                  },
                                  child: const Text(
                                    'LOGIN',
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
                                ))
                              ],
                            ),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SignInScreen()));
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 13,
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
    );
  }
}
