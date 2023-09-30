import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/screens/item_description_view.dart';

class PortraitCard extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String subCategoryName;
  final String itemImage;

  const PortraitCard({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.subCategoryName,
    required this.itemImage,
  }) : super(key: key);

  @override
  _PortraitCardState createState() => _PortraitCardState();
}

class _PortraitCardState extends State<PortraitCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: MyColors.black10, borderRadius: BorderRadius.circular(12)),
      width: 128,
      height: 194,
      child: Column(
        children: [
          // -------------------- navigate to description page on tap START-------------
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ItemDescription(
                    image: widget.itemImage,
                    itemname: widget.itemName,
                    itemprice: widget.itemPrice,
                    itemdesc: widget.subCategoryName,
                  );
                },
              ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.asset(
                widget.itemImage,
                width: 68,
                height: 68,
              ),
            ),
          ),
          // -------------------- navigate to description page on tap END-------------
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: MyColors.black100),
                ),
                Text(
                  widget.subCategoryName,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black60),
                ),
                Container(
                  height: 24,
                  width: 108,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.black1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.itemPrice}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black60),
                      ),

                      // ------------------------Add to cart button plus start-------------------
                      InkWell(
                        onTap: () {
                          setState(() {
                            // Create a map representing the item to be added to the cart
                            Map<String, dynamic> cartItem = {
                              'itemName': widget.itemName,
                              'itemPrice': widget.itemPrice,
                              'subCategoryName': widget.subCategoryName,
                              'itemImage': widget.itemImage,
                            };

                            // Add the cart item to the cartItems list
                            cartItems.add(cartItem);

                            // Optionally, you can show a snackbar or perform any other action to confirm that the item was added to the cart
                            final snackBar = SnackBar(
                              content:
                                  Text('${widget.itemName} added to the cart'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            cartItems.length;
                          });
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: MyColors.blueD,
                          size: 24,
                        ),
                      )
                      // ------------------------Add to cart button plus end-------------------
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
