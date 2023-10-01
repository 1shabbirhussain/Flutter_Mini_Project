import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/custom%20widgets/custom_button.dart';
import 'package:mynewproject/screens/check_out.view.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    double calculateTotalCost() {
      double totalCost = 0.0;
      for (var item in cartItems) {
        double itemPrice = double.tryParse(item["itemPrice"] ?? "0.0") ?? 0.0;
        totalCost += itemPrice;
      }
      return totalCost;
    }

    double delivery() {
      double deliveryCost = 0.0;
      if (cartItems.isNotEmpty) {
        deliveryCost = 2.00; // Set the delivery cost when the cart is not empty
      }
      return deliveryCost;
    }

    return SafeArea(
        child: Scaffold(
      // -------------------------------------APP BAR------------------
      appBar: AppBar(
        shadowColor: MyColors.black10,
        iconTheme: IconThemeData(
          color: MyColors.black100, // Change this color to your desired color
        ),
        backgroundColor: MyColors.black1,
        title: Text(
          "Add Card",
          style: TextStyle(color: MyColors.black100),
        ),
      ),
      // -----------------------------------body---------------------------
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD HOLDER NAME",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: "Shabbir Hussain"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "CARD NUMBER",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: "123-456-789-123"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "EXP DATE",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "MM/DD",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: 16), // Add spacing between the two fields
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CVC",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "1234",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // ------------------------------------calculation  Start-------------------------------
          Container(
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: MyColors.black20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyColors.black60),
                    ),
                    Text("\$ ${calculateTotalCost()}")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyColors.black60),
                    ),
                    Text("\$ ${delivery()}")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyColors.black60),
                    ),
                    Text("\$ ${calculateTotalCost() + delivery()}")
                  ],
                ),
                Container(
                  child: CustomButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CheckOut();
                          },
                        ));
                      },
                      buttonBackground: MyColors.blueL,
                      borderRadius: BorderRadius.circular(20),
                      width: double.infinity,
                      height: 56,
                      textWidget: Text(
                        "Make Payment",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black1),
                      )),
                )
              ],
            ),
          )
          // ---------------------------------------Bottom Total cost container END--------------------------------
        ],
      ),
    ));
  }
}
