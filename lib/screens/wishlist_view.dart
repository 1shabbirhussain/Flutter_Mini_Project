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
  // ----------------------------------add to cart function START-----------------------
  void addToCart(int index) {
    setState(() {
      // Create a map representing the item to be added to the cart
      Map<String, dynamic> cartItem = {
        'itemName': wishlistItems[index]["itemName"],
        'itemPrice': wishlistItems[index]["itemPrice"],
        'subCategoryName': wishlistItems[index]["subCategoryName"],
        'itemImage': wishlistItems[index]["itemImage"],
      };

      // Add the cart item to the cartItems list
      cartItems.add(cartItem);

      // Optionally, you can show a snackbar or perform any other action to confirm that the item was added to the cart
      final snackBar = SnackBar(
        content: Text('${wishlistItems[index]["itemName"]} added to the cart'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  // ----------------------------------add to cart function END-----------------------
  Future<void> showRemoveConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap a button to dismiss the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove from Wishlist'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Are you sure you want to remove this item from your wishlist?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Remove'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Remove the item from the wishlist
                setState(() {
                  wishlistItems.removeAt(index);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: MyColors.blueL,
          backgroundColor: MyColors.blueL,
          iconTheme: IconThemeData(
            color: MyColors.black45,
          ),
          title: Text("Your Wishlist"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
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
                ),
              ),
            )
          ],
        ),
        body: wishlistItems.isEmpty
            ? Text("Your Wishlist is Empty")
            : Container(
                child: Column(
                  children: [
                    Container(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: wishlistItems.length,
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
                                          wishlistItems[index]["itemImage"],
                                          width: 35,
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              wishlistItems[index]["itemName"],
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
                                      // ------------------------icon button to remove wishlist ittem START------------------------

                                      IconButton(
                                        onPressed: () {
                                          showRemoveConfirmationDialog(
                                              index); // Show the confirmation dialog
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                      // ------------------------icon button to remove wishlist ittem END------------------------

                                      SizedBox(
                                        width: 10,
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          addToCart(index); // Add item to cart
                                        },
                                        icon: Icon(
                                          Icons.add_shopping_cart,
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
      ),
    );
  }
}
