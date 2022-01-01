import 'package:fatmore/CheckOut/AddDeliveryDetails/addDelivery_addreese.dart';
import 'package:fatmore/CheckOut/singleDeliveryItem.dart';
import 'package:fatmore/Model/deliveryAddressModel.dart';
import 'package:fatmore/Providers/checkoutProvider.dart';
import 'package:fatmore/Screen/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Payemnt/payment_summary.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  // bool isAddress = false;
  late DeliveryAddressModel deliveryAddressModel;

  // List<Widget> address = [
  //   SingleDeliveryItem(
  //       title: "Area",
  //       addressType: "home",
  //       address: "address",
  //       number: "898989")
  // ];

  @override
  void initState() {
    CheckoutProvider initcheckOutProvider = Provider.of(context, listen: false);
    initcheckOutProvider.getDeliveryAddressData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
          "Delivery Details",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAddress(),
            ),
          );
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          color: Colors.deepOrange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
          //  onPressed: () {  },
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text(
                  "Add New Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins-Bold",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                )
              : Text(
                  "Payment summary",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins-Bold",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliveryAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(
                        deliveryAddressList: value,
                      ),
                    ),
                  );
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Deliver To",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins-Bold",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            leading: Icon(
              Icons.location_on,
              color: Colors.deepOrange,
            ),
            // leading: Image.asset("asset/images/location.png",),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 180.0),
                  child: Center(
                    child: Text(
                      "NO DATA ",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontFamily: "Poppins-Bold",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                  ),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    setState(() {
                      value = e;
                    });
                    return SingleDeliveryItem(
                      address1: "Street: ${e.street},  City: ${e.city}",
                      address2: "Pincode: ${e.pinCode}",
                      title: "${e.firstName} ${e.lastName}",
                      number: e.mobileNo,
                      addressType: e.addressType == "AddressTypes.Home"
                          ? "Home"
                          : e.addressType == "AddressTypes.Other"
                              ? "Other"
                              : "Work",
                    );
                  }).toList(),
                )
        ],
      ),
    );
  }
}
