import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';

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
              Icon(
                Icons.add_shopping_cart,
                color: MyColors.black1,
                weight: 16,
              )
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
