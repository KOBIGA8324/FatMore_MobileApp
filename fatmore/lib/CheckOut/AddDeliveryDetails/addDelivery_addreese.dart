import 'package:fatmore/Providers/checkoutProvider.dart';
import 'package:fatmore/Widget/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloadding == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First name",
              controller: checkoutProvider.firstName,
            ),
            CustomTextField(
              labText: "Last name",
              controller: checkoutProvider.lastName,
            ),
            CustomTextField(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
            ),
            CustomTextField(
              labText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
            ),
            // CostomTextField(
            //   labText: "Scoiety",
            //   controller: checkoutProvider.scoiety,
            // ),
            CustomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
            ),
            CustomTextField(
              labText: "Landmark",
              controller: checkoutProvider.landmark,
            ),
            CustomTextField(
              labText: "City",
              controller: checkoutProvider.city,
            ),
            CustomTextField(
              labText: "Area",
              controller: checkoutProvider.area,
            ),
            CustomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            // InkWell(
            //   onTap: () {
            //     // Navigator.of(context).push(
            //     //   MaterialPageRoute(
            //     //     builder: (context) => CustomGoogleMap(),
            //     //   ),
            //     // );
            //   },
            //   // child: Container(
            //   //   height: 47,
            //   //   width: double.infinity,
            //   //   child: Column(
            //   //     mainAxisAlignment: MainAxisAlignment.center,
            //   //     crossAxisAlignment: CrossAxisAlignment.start,
            //   //     children: [
            //   //       checkoutProvider.setLoaction == null
            //   //           ? Text("Set Loaction")
            //   //           : Text("Done!"),
            //   //     ],
            //   //   ),
            //   // ),
            // ),
            // Divider(
            //   color: Colors.black,
            // ),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: Colors.grey,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: Colors.grey,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
