import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/Assets/dummy_data.dart';
import 'package:mynewproject/screens/items_view.dart';
import 'package:mynewproject/screens/sub_categories_view.dart';

class CardCategory extends StatelessWidget {
  final index;
  final String categoryImage;

  const CardCategory(
      {super.key, required this.index, required this.categoryImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ItemsView();
          },
        ));
      },
      child: Container(
          height: 164,
          width: 154,
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: MyColors.black10, borderRadius: BorderRadius.circular(12)),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                categoryImage,
                height: 80,
                width: 80,
              ),
              Column(
                children: [
                  Text(
                    dummyData[index]["category"],
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: MyColors.black100),
                  ),
                  // Text(
                  //   "",
                  //   style: TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400,
                  //       color: MyColors.black60),
                  // ),
                ],
              )
            ],
          )),
    );
    ;
  }
}
