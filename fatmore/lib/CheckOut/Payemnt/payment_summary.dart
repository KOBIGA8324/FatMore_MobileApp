import 'package:fatmore/CheckOut/deliveryDeatils.dart';
import 'package:fatmore/Model/deliveryAddressModel.dart';
import 'package:fatmore/Providers/checkoutProvider.dart';
import 'package:fatmore/Providers/review_cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../EndUp.dart';
import '../singleDeliveryItem.dart';
import 'orderItem.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAddressList;
  PaymentSummary({required this.deliveryAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;
  @override
  void initState() {
    CheckoutProvider initcheckOutProvider = Provider.of(context, listen: false);
    initcheckOutProvider.getDeliveryAddressData();
    ReviewCartProvider initReviewProvider = Provider.of(context, listen: false);
    initReviewProvider.getReviewCartData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 30;
    double discountValue = 0;
    double shippingChanrge = 3.7;
    double total = 0;
    double totalPrice = reviewCartProvider.getTotalPrice();
    total = (totalPrice + shippingChanrge) - discount;
    // if (totalPrice > 300) {
    //   discountValue = (totalPrice * discount) / 100;
    //
    //
    //   total = totalPrice -discountValue;
    // }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DeliveryDetails()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Payment Summary",
          style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins-Bold",
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins-Bold",
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
        subtitle: Text(
          "\LKR ${total}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins-Bold",
            fontSize: 16,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => (EndScreen()),
              ));
            },
            child: Text(
              "Pleace Order",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins-Bold"),
            ),
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address1:
                      "Street: ${widget.deliveryAddressList.street}, City: ${widget.deliveryAddressList.city}",
                  address2: "Pincode: ${widget.deliveryAddressList.pinCode}",
                  title:
                      "${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName}",
                  number: widget.deliveryAddressList.mobileNo,
                  addressType: widget.deliveryAddressList.addressType ==
                          "AddressTypes.Home"
                      ? "Home"
                      : widget.deliveryAddressList.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : "Work",
                ),

                ExpansionTile(
                  children:
                      reviewCartProvider.getReviewCartDataList.map((data) {
                    return OrderItem(
                      e: data,
                    );
                  }).toList(),
                  title: Text(
                    "Order Items ${reviewCartProvider.getReviewCartDataList.length}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Bold"),
                  ),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Bold"),
                  ),
                  trailing: Text(
                    "\LKR ${totalPrice}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Bold"),
                  ),
                ),

                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(
                        color: Colors.grey[600], fontFamily: "Poppins-Bold"),
                  ),
                  trailing: Text(
                    "\LKR ${shippingChanrge}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Discount",
                    style: TextStyle(
                        color: Colors.grey[600], fontFamily: "Poppins-Bold"),
                  ),
                  trailing: Text(
                    "\LKR ${discount}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                // ListTile(
                //   leading: Text("Payment Options"),
                // ),
                // RadioListTile(
                //   value: AddressTypes.Home,
                //   groupValue: myType,
                //   title: Text("Home"),
                //   onChanged: (AddressTypes? value) {
                //     setState(() {
                //       myType = value!;
                //     });
                //   },
                //   secondary: Icon(
                //     Icons.work,
                //     color: Colors.grey,
                //   ),
                // ),
                // RadioListTile(
                //   value: AddressTypes.OnlinePayment,
                //   groupValue: myType,
                //   title: Text("OnlinePayment"),
                //   onChanged: (AddressTypes? value) {
                //     setState(() {
                //       myType = value!;
                //     });
                //   },
                //   secondary: Icon(
                //     Icons.devices_other,
                //     color: Colors.grey,
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
