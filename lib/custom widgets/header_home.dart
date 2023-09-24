import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mynewproject/screens/cart_view.dart';

class HomePageHeader1 extends StatefulWidget {
  const HomePageHeader1({super.key});

  @override
  State<HomePageHeader1> createState() => _HomePageHeader1State();
}

class _HomePageHeader1State extends State<HomePageHeader1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.blueL,
      height: 250,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
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
                    color: MyColors.black1),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CartView();
                    },
                  ));
                },
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                      badgeColor: MyColors.yellowD, padding: EdgeInsets.all(3)),
                  badgeContent: Text("2"),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: MyColors.black1,
                    weight: 16,
                  ),
                ),
              )
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
            child: const TextField(
              style: TextStyle(color: MyColors.black45),
              decoration: InputDecoration(
                hintText: "Search Product or Stores",
                hintStyle: TextStyle(
                    color: MyColors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
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
                            color: MyColors.black45),
                      ),
                      Text(
                        "GREEN WAY 3000,SYLHET",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
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
                            color: MyColors.black45),
                      ),
                      Text(
                        "1 Hour",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
                      ),
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
