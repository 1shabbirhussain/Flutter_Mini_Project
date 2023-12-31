import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/custom%20widgets/home_page_header1.dart';
import 'package:mynewproject/custom%20widgets/landscape_card.dart';
import 'package:mynewproject/custom%20widgets/portrait_card.dart';

class GroceryHome extends StatelessWidget {
  const GroceryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          HomePageHeader1(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.symmetric(vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Portrait Cards
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        LandscapeCard(),
                        LandscapeCard(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // Text
                  Container(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: MyColors.black100),
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  // portrait Cards
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PortraitCard(),
                        PortraitCard(),
                        PortraitCard(),
                        PortraitCard(),
                        PortraitCard(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PortraitCard(),
                        PortraitCard(),
                        PortraitCard(),
                        PortraitCard(),
                        PortraitCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
