import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/custom%20widgets/custom_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double calculateTotalCost() {
    double totalCost = 0.0;
    for (var item in cartItems) {
      double itemPrice = double.tryParse(item["itemPrice"] ?? "0.0") ?? 0.0;
      totalCost += itemPrice;
    }
    return totalCost;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              shadowColor: MyColors.blueL,
              backgroundColor: MyColors.blueL,
              title: Text("Product cart"),
            ),
            // --------------------condition to chekc if cart is empty-----
            body: Column(
              children: [
                cartItems.isEmpty
                    ? Text("Your Cart is Empty")
                    : Expanded(
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          // itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: MyColors.black45,
                                          width: 1.0))),
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 40,
                                            width: 40,
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                                color: MyColors.black20,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: SvgPicture.asset(
                                              cartItems[index]["itemImage"],
                                              width: 35,
                                            )),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartItems[index]["itemName"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                "\$ ${cartItems[index]["itemPrice"]}/kg",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: MyColors.black60),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              cartItems.removeAt(index);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_circle_rounded,
                                            color: MyColors.black60,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("0"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add_circle_rounded,
                                            color: MyColors.black60,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
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
                          Text("\$ ${2.00}")
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
                          Text("\$ ${calculateTotalCost() + 2.00}")
                        ],
                      ),
                      Container(
                        child: CustomButton(
                            onPressed: () {},
                            buttonBackground: MyColors.blueD,
                            borderRadius: BorderRadius.circular(20),
                            width: 320,
                            height: 56,
                            textWidget: Text(
                              "Process to Checkout",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.black1),
                            )),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
