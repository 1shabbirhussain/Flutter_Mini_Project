import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/screens/cart_view.dart';
import 'package:badges/badges.dart' as badges;

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        shadowColor: MyColors.blueL,
        backgroundColor: MyColors.blueL,
        iconTheme: IconThemeData(
          color: MyColors.black45, // Change this color to your desired color
        ),
        title: Text(
          "Your Wishlist",
        ),
        actions: [
          // Icon(Icons.ac_unit_outlined)
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),

            // -----------------------------CART BADGE START--------------------

            child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CartView();
                      },
                    ),
                  );
                  setState(() {});
                },
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: MyColors.yellowD,
                    padding: EdgeInsets.all(3),
                  ),
                  badgeContent: Text("${cartItems.length}"),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: MyColors.black1,
                    size: 20,
                  ),
                )),
            // -----------------------------CART BADGE END--------------------
          )
        ],
      ),
      // --------------------condition to chekc if cart is empty-----
      body: wishlistItems.isEmpty
          ? Text("Your Wishlist is Empty")
          : Container(
              child: Column(
                children: [
                  Container(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: wishlistItems.length,
                      // itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: MyColors.black45, width: 1.0))),
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
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: SvgPicture.asset(
                                          wishlistItems[index]["itemImage"],
                                          width: 35,
                                        )),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            wishlistItems[index]["itemName"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            wishlistItems[index]["itemPrice"],
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
                                        Icons.favorite,
                                        color: MyColors.black60,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.shopping_bag,
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
                ],
              ),
            ),
    ));
  }
}
