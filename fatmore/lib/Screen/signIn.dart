import 'package:fatmore/Providers/userProvider.dart';
import 'package:fatmore/Services/authendicationServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import 'login.dart';

class SignInScreen extends StatefulWidget {
  static String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool _validate4 = false;
  //String validateEmail = "Please enter valid email";
  bool isloading = false;
  bool _isObscure = true;
  //late UserCredential userCredential;
  RegExp regExp = RegExp(SignInScreen.pattern);

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  // final AuthendicationServices _auth = AuthendicationServices();
  late UserProvider userProvider;

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: isloading
          ? Center(
              child: Container(
                height: 20,
                width: 20,
                //color: Colors.deepOrangeAccent,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topRight,
                        image:
                            AssetImage("asset/images/popular/Nasi Goreng.png"),
                        fit: BoxFit.contain,
                        //alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                "REGISTER",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Icon(
                                    Icons.person,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _username,
                                    decoration: InputDecoration(
                                        errorText: _validate1
                                            ? 'Username Can\'t Be Empty'
                                            : null,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.white.withOpacity(0.3),
                                        )),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10),
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle: InputText),
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.name,
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
                                  Icons.alternate_email,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                      errorText: _validate2
                                          ? 'Email address Can\'t Be Empty'
                                          : _validate4
                                              ? 'Enter valid email'
                                              : null,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.3),
                                      )),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20),
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: InputText),
                                  style: const TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
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
                                      errorText: _validate3
                                          ? 'Password Can\'t Be Empty'
                                          : null,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.3),
                                      )),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: InputText),
                                  style: TextStyle(color: Colors.white),
                                  // keyboardType: TextInputType.,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                              child: RaisedButton(
                            onPressed: () {
                              if (_username.text.isNotEmpty &&
                                  _email.text.isNotEmpty &&
                                  _password.text.isNotEmpty) {
                                setState(() {
                                  // _password.text. = false;
                                  isloading = true;
                                });
                                CreateNewUSer(_username.text, _email.text,
                                        _password.text)
                                    .then((user) {
                                  if (user != null) {
                                    setState(() {
                                      isloading = false;
                                    });
                                    print("Account created");
                                    userProvider.addUserData(
                                        userName: _username.text,
                                        currentUser: user,
                                        userEmail: _email.text);
                                  } else {
                                    print("failed");
                                  }
                                });
                              } else {
                                print("enter filed");
                              }
                              setState(() {
                                if (_username.text.isEmpty) {
                                  _validate1 = true;
                                } else {
                                  _validate1 = false;
                                }

                                if (_email.text.isEmpty) {
                                  _validate2 = true;
                                } else if (!regExp.hasMatch(_email.text)) {
                                  _validate4 = true;
                                } else {
                                  _validate2 = false;
                                }
                                if (_password.text.isEmpty) {
                                  _validate3 = true;
                                } else {
                                  _validate3 = false;
                                }
                              });
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 2.5,
                                  fontWeight: FontWeight.bold),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            color: Colors.deepOrangeAccent,
                          )),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              },
                              child: const Text(
                                'Login',
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.facebook,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.chat,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
    );
  }

  /* void createNewUser() async {
    dynamic result =
        await _auth.createNewUser(_username.text, _email.text, _password.text);
    if (result == null) {
      print("Email is not valid");
    } else {
      print(result.toString());
    }
  }*/
}
