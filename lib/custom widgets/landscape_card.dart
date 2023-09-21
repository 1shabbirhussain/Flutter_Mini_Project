import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';

class LandscapeCard extends StatelessWidget {
  const LandscapeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 269,
                        height: 123,
                        decoration: BoxDecoration(
                          color: MyColors.yellowD,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "images/ImageIcon.png",
                              width: 68,
                              height: 68,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Get",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.black1),
                                ),
                                Text(
                                  "50% OFF",
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.black1),
                                ),
                                Text(
                                  "On first 03 Orders",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.black1),
                                )
                              ],
                            )
                          ],
                        ),
                      );
  }
}