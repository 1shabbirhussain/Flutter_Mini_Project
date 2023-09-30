import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mynewproject/screens/cart_view.dart';

class HeaderCategories extends StatefulWidget {
  const HeaderCategories({super.key});

  @override
  State<HeaderCategories> createState() => _HeaderCategoriesState();
}

class _HeaderCategoriesState extends State<HeaderCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.blueL,
      height: 250,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hey, Halal",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: MyColors.black1),
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
            alignment: Alignment.bottomLeft,
            height: 126,
            // width: 299,
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Shop \n",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w200,
                      color: MyColors.black1)),
              TextSpan(
                  text: "By Category",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: MyColors.black1))
            ])),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
