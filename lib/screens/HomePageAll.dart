import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/Assets/dummy_data.dart';
import 'package:mynewproject/custom%20widgets/card_landscape.dart';
import 'package:mynewproject/screens/cart_view.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mynewproject/screens/item_description_view.dart';

class HomePageAll extends StatefulWidget {
  const HomePageAll({Key? key}) : super(key: key);

  @override
  _HomePageAllState createState() => _HomePageAllState();
}

class _HomePageAllState extends State<HomePageAll> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // -----------------------------HEADER START--------------------

            Container(
              color: MyColors.blueL,
              height: 250,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hey, Halal",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: MyColors.black1,
                        ),
                      ),
                      // -----------------------------CART BADGE START--------------------
                      InkWell(
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
                    ],
                  ),
                  Container(
                    height: 56,
                    width: 335,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: MyColors.blueD,
                    ),
                    child: TextField(
                      style: TextStyle(color: MyColors.black45),
                      decoration: InputDecoration(
                        hintText: "Search Product or Stores",
                        hintStyle: TextStyle(
                          color: MyColors.black45,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: MyColors.black1,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: 335,
                    height: 38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DELIVERY TO",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  color: MyColors.black45,
                                ),
                              ),
                              Text(
                                "GREEN WAY 3000,SYLHET",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.black1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "WITHIN",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  color: MyColors.black45,
                                ),
                              ),
                              Text(
                                "1 Hour",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.black1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ---------------------HEADER END------------------------
            Expanded(
              // -------------------------YELLOW POSTER START-------------------
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          LandscapeCard(),
                          LandscapeCard(),
                        ],
                      ),
                    ),
                    // ------------------YELLOW POSTER END---------------------
                    SizedBox(
                      height: 25,
                    ),
                    // -------------------RECOMMENDED HEADING--------------------------
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: MyColors.black100,
                        ),
                      ),
                    ),
                    // -------------------RECOMMENDED HEADING END--------------------------

                    SizedBox(
                      height: 25,
                    ),
                    // ---------------------------------PORTRAIT CARDS LIST VIEW BUILDER ITEMS START---------------
                    Container(
                      height: 194,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (dummyData.length / 3).floor(),
                        itemBuilder: (context, index) {
                          final subCategories =
                              dummyData[index]["subCategories"];
                          final List<Widget> itemCards = [];

                          for (var subCategory in subCategories) {
                            final subCategoryName =
                                subCategory["subCategoryName"];
                            final items = subCategory["items"];

                            for (var item in items) {
                              itemCards.add(
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    color: MyColors.black10,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  width: 128,
                                  height: 194,
                                  child: Column(
                                    children: [
                                      // -------------------- navigate to description page on tap START-------------

                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return ItemDescription(
                                                image: item["itemImage"],
                                                itemname: item["itemName"],
                                                itemprice: item["itemPrice"],
                                                itemdesc: subCategoryName,
                                                isWishlist: item["isWishlist"],
                                              );
                                            },
                                          ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: SvgPicture.asset(
                                            item["itemImage"],
                                            width: 68,
                                            height: 68,
                                          ),
                                        ),
                                      ),
                                      // -------------------- navigate to description page on tap END-------------
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item["itemName"],
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: MyColors.black100,
                                              ),
                                            ),
                                            Text(
                                              subCategoryName,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: MyColors.black60,
                                              ),
                                            ),
                                            Container(
                                              height: 24,
                                              width: 108,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: MyColors.black1,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "\$ ${item["itemPrice"]}/kg",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: MyColors.black60,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        // Create a map representing the item to be added to the cart
                                                        Map<String, dynamic>
                                                            cartItem = {
                                                          'itemName':
                                                              item["itemName"],
                                                          'itemPrice':
                                                              item["itemPrice"],
                                                          'subCategoryName':
                                                              subCategoryName,
                                                          'itemImage':
                                                              item["itemImage"],
                                                        };

                                                        // Add the cart item to the cartItems list
                                                        cartItems.add(cartItem);

                                                        // Optionally, you can show a snackbar or perform any other action to confirm that the item was added to the cart
                                                        final snackBar =
                                                            SnackBar(
                                                          content: Text(
                                                              '${item["itemName"]} added to the cart'),
                                                          duration: Duration(
                                                              seconds: 2),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.add_circle,
                                                      color: MyColors.blueD,
                                                      size: 24,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }

                          return Row(
                            children: itemCards,
                          );
                        },
                      ),
                    ),
                    // ---------------------------------PORTRAIT CARDS LIST VIEW BUILDER ITEMS END---------------

                    SizedBox(
                      height: 25,
                    ),
                    // ---------------------------------PORTRAIT CARDS LIST VIEW BUILDER ITEMS START---------------
                    Container(
                      height: 194,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (dummyData.length / 3).floor(),
                        itemBuilder: (context, index) {
                          final subCategories =
                              dummyData[dummyData.length - 1 - index]
                                  ["subCategories"];
                          final List<Widget> itemCards = [];

                          for (var subCategory in subCategories) {
                            final subCategoryName =
                                subCategory["subCategoryName"];
                            final items = subCategory["items"];

                            for (var item in items) {
                              itemCards.add(
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    color: MyColors.black10,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  width: 128,
                                  height: 194,
                                  child: Column(
                                    children: [
                                      // -------------------- navigate to description page on tap START-------------

                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return ItemDescription(
                                                image: item["itemImage"],
                                                itemname: item["itemName"],
                                                itemprice: item["itemPrice"],
                                                itemdesc: subCategoryName,
                                                isWishlist: item["isWishlist"],
                                              );
                                            },
                                          ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: SvgPicture.asset(
                                            item["itemImage"],
                                            width: 68,
                                            height: 68,
                                          ),
                                        ),
                                      ),
                                      // -------------------- navigate to description page on tap END-------------
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item["itemName"],
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: MyColors.black100,
                                              ),
                                            ),
                                            Text(
                                              subCategoryName,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: MyColors.black60,
                                              ),
                                            ),
                                            Container(
                                              height: 24,
                                              width: 108,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: MyColors.black1,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "\$ ${item["itemPrice"]}/kg",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: MyColors.black60,
                                                    ),
                                                  ),
                                                  // ----------------------------add to card plus button START----------------
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        // Create a map representing the item to be added to the cart
                                                        Map<String, dynamic>
                                                            cartItem = {
                                                          'itemName':
                                                              item["itemName"],
                                                          'itemPrice':
                                                              item["itemPrice"],
                                                          'subCategoryName':
                                                              subCategoryName,
                                                          'itemImage':
                                                              item["itemImage"],
                                                          'itemImage':
                                                              item["itemImage"],
                                                          'isWishlist': item[
                                                              "isWishlist"],
                                                        };

                                                        // Add the cart item to the cartItems list
                                                        cartItems.add(cartItem);

                                                        // Optionally, you can show a snackbar or perform any other action to confirm that the item was added to the cart
                                                        final snackBar =
                                                            SnackBar(
                                                          content: Text(
                                                              '${item["itemName"]} added to the cart'),
                                                          duration: Duration(
                                                              seconds: 2),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.add_circle,
                                                      color: MyColors.blueD,
                                                      size: 24,
                                                    ),
                                                  )
                                                  // ----------------------------add to card plus button END----------------
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }

                          return Row(
                            children: itemCards,
                          );
                        },
                      ),
                    ),
                    // ---------------------------------PORTRAIT CARDS LIST VIEW BUILDER ITEMS END---------------

                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
