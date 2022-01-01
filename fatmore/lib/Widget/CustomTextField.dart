import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labText;
  //final TextInputType keyboardType;
  CustomTextField(
      {required this.controller,
      //// required this.keyboardType,
      required this.labText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Poppins-Bold",
          fontSize: 15,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5),
      // keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        //   hintText: TextStyle(color: Colors.deepOrange),
        // focusColor: Colors.deepOrange,
        // fillColor: Colors.orange,
        //hintStyle: TextStyle(color: Colors.red),

        //  labelStyle: TextStyle(color: Colors.deepOrange.shade200),
        //hintTextDirection: TextStyle(color: Colors.deepOrange.shade200),
        labelText: labText,
      ),
    );
  }
}
