import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
      body: cartItems.isEmpty
          ? Text("Your Cart is Empty")
          : ListView.builder(
              itemCount: cartItems.length,
              // itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: MyColors.black45, width: 1.0))),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: MyColors.black20,
                                    borderRadius: BorderRadius.circular(100)),
                                child: SvgPicture.asset(
                                  cartItems[index]["itemImage"],
                                  width: 35,
                                )),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems[index]["itemName"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    cartItems[index]["itemPrice"],
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
    ));
  }
}
