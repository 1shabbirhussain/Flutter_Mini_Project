import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';

class PortraitCard extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String subCategoryName;

  const PortraitCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.subCategoryName,
  });

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
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              "images/ImageIcon.png",
              color: MyColors.black90,
              width: 68,
              height: 68,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: MyColors.black100),
                ),
                Text(
                  subCategoryName,
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
                        "\$ $itemPrice",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black60),
                      ),
                      // Text(
                      //   "\$12",
                      //   style: TextStyle(
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w600,
                      //       color: MyColors.black60),
                      // ),
                      Icon(
                        Icons.add_circle,
                        color: MyColors.blueD,
                        size: 24,
                      )
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
