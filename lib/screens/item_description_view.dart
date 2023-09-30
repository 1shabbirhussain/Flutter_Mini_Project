import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/custom%20widgets/custom_button.dart';
import 'package:mynewproject/screens/cart_view.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemDescription extends StatefulWidget {
  final image;
  final itemname;
  final itemprice;
  final itemdesc;
  final isWishlist;
  const ItemDescription({
    super.key,
    required this.image,
    required this.itemname,
    required this.itemprice,
    required this.itemdesc,
    required this.isWishlist,
  });

  @override
  State<ItemDescription> createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  @override
  void initState() {
    super.initState();
    // Check if the item is in the wishlist and update the isWishlist variable accordingly
    isWishlist =
        wishlistItems.any((item) => item['itemName'] == widget.itemname);
  }

  bool isWishlist = false; // Initially not in wishlist

  // Function to toggle the wishlist item
  void toggleWishlist() {
    setState(() {
      isWishlist = !isWishlist; // Toggle the wishlist state

      Map<String, dynamic> wishlistItem = {
        'itemName': widget.itemname,
        'itemPrice': widget.itemprice,
        'subCategoryName': widget.itemdesc,
        'itemImage': widget.image,
        "isWishlist": isWishlist,
      };

      if (isWishlist) {
        wishlistItems.add(wishlistItem); // Add to wishlist when it turns red
      } else {
        wishlistItems.removeWhere((item) =>
            item['itemName'] ==
            widget.itemname); // Remove from wishlist when it turns grey
      }
      print(wishlistItems);
    });
  }

  // ---------------------------carousel images list------------------------
  static const List<String> sampleImages = [
    "images/ImageIcon.png",
    "images/ImageIcon.png",
    "images/ImageIcon.png"
  ];
  // ---------------------------carousel images list end------------------------

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        shadowColor: MyColors.black1,
        backgroundColor: MyColors.black1,
        iconTheme: IconThemeData(
          color: MyColors.black45, // Change this color to your desired color
        ),
        title: Text(
          widget.itemname,
          style: TextStyle(color: MyColors.black100),
        ),
        actions: [
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
                    color: MyColors.black100,
                    size: 20,
                  ),
                )),
            // -----------------------------CART BADGE END--------------------
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // --------------------carousel start=--------------------------------
            Container(
              child: FanCarouselImageSlider(
                  imagesLink: [widget.image, widget.image, widget.image],
                  isAssets: false,
                  sliderHeight: 200,
                  sliderWidth: double.infinity,
                  imageFitMode: BoxFit.contain,
                  expandedImageFitMode: BoxFit.contain,
                  currentItemShadow: [
                    BoxShadow(
                      color: MyColors.black1,
                    )
                  ],
                  sliderDuration: Duration(milliseconds: 300)),
            ),
            // --------------------carousel end=--------------------------------
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------------------------------- add to wish list icon row START------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best choice",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black100,
                          ),
                        ),
                        IconButton(
                          onPressed: toggleWishlist,
                          icon: Icon(
                            Icons.favorite,
                            color: isWishlist ? Colors.red : MyColors.black45,
                          ),
                        ),
                      ],
                    ),
                    // ---------------------------------- add to wish list icon row END------------

                    Text(
                      widget.itemname,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: MyColors.black100),
                    ),
                    SizedBox(height: 10),
                    // ----------------------price wali puri row START------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${widget.itemprice} per kg",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: MyColors.black100),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.blueD),
                          child: Text(
                            "\$ 22.04 OFF",
                            style: TextStyle(
                                color: MyColors.black20,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          "Reg: \$56.70 USD",
                          style: TextStyle(
                              color: MyColors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    // ----------------------price wali puri row END------------

                    SizedBox(height: 10),
                    // --------------------------rating package START-----------------------
                    Container(
                      child: RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    // --------------------------rating package END-----------------------
                    SizedBox(height: 10),
                    // ---------------------------buttons START------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ----------------------------add to cart button START----------------------
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              // Create a map representing the item to be added to the cart
                              Map<String, dynamic> cartItem = {
                                'itemName': widget.itemname,
                                'itemPrice': widget.itemprice,
                                'subCategoryName': widget.itemdesc,
                                'itemImage': widget.image,
                              };

                              // Add the cart item to the cartItems list
                              cartItems.add(cartItem);

                              // Optionally, you can show a snackbar or perform any other action to confirm that the item was added to the cart
                              final snackBar = SnackBar(
                                content: Text(
                                    '${widget.itemname} added to the cart'),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              cartItems.length;
                            });
                          },
                          buttonBackground: MyColors.black1,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          width: 150,
                          height: 56,
                          textWidget: Text("Add To Cart",
                              style: TextStyle(color: MyColors.blueD)),
                        ),
                        // ----------------------------add to cart button END-----------------------------
                        CustomButton(
                            onPressed: () {},
                            buttonBackground: MyColors.blueD,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            width: 150,
                            height: 56,
                            textWidget: Text("Buy Now")),
                      ],
                    ),

                    // ---------------------------buttons END------------------------------
                    SizedBox(height: 10),
                    ExpansionTile(
                      initiallyExpanded: true,
                      leading: Icon(Icons.description_outlined),
                      title: Text("Details"),
                      children: [
                        Text(
                            "This is the descruption of my product and product lie under the sub category ${widget.itemdesc}")
                      ],
                    ),

                    ExpansionTile(
                      leading: Icon(Icons.fact_check_outlined),
                      title: Text("Nutritional facts"),
                      children: [
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec ligula vel velit posuere fermentum. Etiam at erat eget metus laoreet cursus. Vivamus tincidunt quam eu tellus feugiat, in euismod libero luctus")
                      ],
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.reviews_outlined),
                      title: Text("Reviews"),
                      children: [
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec ligula vel velit posuere fermentum. Etiam at erat eget metus laoreet cursus. Vivamus tincidunt quam eu tellus feugiat, in euismod libero luctus")
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
