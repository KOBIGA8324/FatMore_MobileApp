import 'package:fatmore/Model/deliveryAddressModel.dart';
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
  late CheckoutProvider checkoutProvider;
  late DeliveryAddressModel value;
  // bool isAddress = false;
  late DeliveryAddressModel deliveryAddressModel;
  var myType = AddressTypes.Home;

  @override
  void initState() {
    CheckoutProvider initcheckOutProvider = Provider.of(context, listen: false);
    initcheckOutProvider.getDeliveryAddressData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkoutProvider = Provider.of<CheckoutProvider>(context);
    checkoutProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Add Delivery Address",
          style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins-Bold",
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloadding == false
            // checkoutProvider.getDeliveryAddressList.isEmpty
            ? MaterialButton(
                // checkoutProvider.getDeliveryAddressList.isEmpty
                onPressed: () {
                  // if (checkoutProvider.getDeliveryAddressList.isEmpty) {
                  checkoutProvider.validator(context, myType);
                  // }
                },
                child: Text("Add Address",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins-Bold",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
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
            // CustomTextField(
            //   labText: "Area",
            //   controller: checkoutProvider.area,
            // ),
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
              title: Text(
                "Address Type*",
                style: TextStyle(
                    fontFamily: "Poppins-Bold",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Colors.grey),
              ),
            ),
            RadioListTile(
              activeColor: Colors.deepOrange,
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text(
                "Home",
                style: TextStyle(
                    fontFamily: "Poppins-Bold",
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: Colors.deepOrange,
              ),
            ),
            RadioListTile(
              activeColor: Colors.deepOrange,
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text(
                "Work",
                style: TextStyle(
                    fontFamily: "Poppins-Bold",
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: Colors.deepOrange,
              ),
            ),
            RadioListTile(
              activeColor: Colors.deepOrange,
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text(
                "Other",
                style: TextStyle(
                    fontFamily: "Poppins-Bold",
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: Colors.deepOrange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
