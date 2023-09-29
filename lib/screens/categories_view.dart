import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/dummy_data.dart';
import 'package:mynewproject/custom%20widgets/card_category.dart';
import 'package:mynewproject/custom%20widgets/header_categories.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      // Large screens: Set crossAxisCount to 3 or any other value as needed
      return 3;
    } else {
      // Small screens: Set crossAxisCount to 2 or your default value
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          HeaderCategories(),
          Expanded(
              child: SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: calculateCrossAxisCount(context),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 154 / 164,
                    ),
                    itemCount: dummyData.length,
                    itemBuilder: (context, index) {
                      return CardCategory(
                        index: index,
                      );
                    },
                  )))
        ],
      ),
    ));
  }
}
