import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/Assets/subCategoryData.dart';
import 'package:mynewproject/custom%20widgets/card_sub_category.dart';
import 'package:mynewproject/custom%20widgets/header_categories.dart';
import 'package:mynewproject/screens/home_view.dart';



class Categories2 extends StatefulWidget {
  const Categories2({super.key});

  @override
  State<Categories2> createState() => _Categories2State();
}

class _Categories2State extends State<Categories2> {
  PageController pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          HeaderCategories(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        color: MyColors.yellowL,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Meats & Fishes",
                        style: TextStyle(color: MyColors.black1, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                      height: 30,
                      width: 110,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 243, 243),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: MyColors.black100)),
                      child: Center(
                        child: Text(
                          "Vegetables",
                          style:
                              TextStyle(color: MyColors.black100, fontSize: 12),
                        ),
                      )),
                  SizedBox(width: 5),
                  Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: MyColors.black1,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: MyColors.black100)),
                      child: Center(
                        child: Text(
                          "Fruits",
                          style:
                              TextStyle(color: MyColors.black100, fontSize: 12),
                        ),
                      )),
                  SizedBox(width: 5),
                  Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: MyColors.black1,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: MyColors.black100)),
                      child: Center(
                        child: Text(
                          "Fruits",
                          style:
                              TextStyle(color: MyColors.black100, fontSize: 12),
                        ),
                      ))
                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: subCategoryData.length,
                  itemBuilder: (context, index) {
                    return SubCategoryCards(
                      subCategoryName: subCategoryData[index]
                          ["subCategoryName"],
                      subCategoryOrigin: subCategoryData[index]
                          ["subCategoryOrigin"],
                      PerKg: subCategoryData[index]["PerKg"],
                      subCategoryImage: subCategoryData[index]
                          ["subCategoryImage"],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()));
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    ));
  }
}
