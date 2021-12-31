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
        title: Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$${total}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
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
              ),
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
                  address:
                      "area, ${widget.deliveryAddressList.area}, street, ${widget.deliveryAddressList.street},  pincode ${widget.deliveryAddressList.pinCode}",
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
                Divider(),
                ExpansionTile(
                  children:
                      reviewCartProvider.getReviewCartDataList.map((data) {
                    return OrderItem(
                      e: data,
                    );
                  }).toList(),
                  title: Text(
                      "Order Items ${reviewCartProvider.getReviewCartDataList.length}"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\$${totalPrice}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$${shippingChanrge}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Compen Discount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$${discount}",
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
