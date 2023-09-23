import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 164,
        width: 154,
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: MyColors.black10, borderRadius: BorderRadius.circular(12)),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "images/ImageIcon.png",
              height: 57,
              width: 57,
            ),
            Column(
              children: [
                Text(
                  "Fishes",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: MyColors.black100),
                ),
                Text(
                  "From Sea",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black60),
                ),
              ],
            )
          ],
        ));
    ;
  }
}
