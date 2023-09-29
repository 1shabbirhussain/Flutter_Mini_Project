import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/Assets/dummy_data.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:mynewproject/custom%20widgets/card_portrait.dart';
import 'package:mynewproject/screens/categories_view.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({Key? key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView>
    with SingleTickerProviderStateMixin {
  late TabController tabbarcontroller;

  @override
  void initState() {
    super.initState();
    tabbarcontroller = TabController(length: 8, vsync: this);
    tabbarcontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabbarcontroller.dispose();
    super.dispose();
  }

  String getTitle() {
    if (tabbarcontroller.index < dummyData.length) {
      return "${dummyData[tabbarcontroller.index]["category"]}";
    } else {
      return "All";
    }
  }

  List<Map<String, dynamic>> filterDataByTab(int tabIndex) {
    if (tabIndex == 7) {
      // If it's the "All" tab, return all items from all subcategories
      List<Map<String, dynamic>> allItems = [];
      for (var categoryData in dummyData) {
        List<Map<String, dynamic>> subCategories =
            categoryData['subCategories'];

        for (var subCategoryData in subCategories) {
          List<Map<String, dynamic>> items = subCategoryData['items'];

          for (var itemData in items) {
            Map<String, dynamic> newItem = {
              'subCategoryName': subCategoryData['subCategoryName'],
              'itemName': itemData['itemName'],
              'itemPrice': itemData['itemPrice'],
              'itemImage': itemData['itemImage'],
            };
            allItems.add(newItem);
          }
        }
      }
      return allItems;
    } else {
      // For other tabs, return items for the specific subcategory
      String subcategoryName =
          dummyData[tabIndex]["subCategories"][0]["subCategoryName"];
      List<Map<String, dynamic>> subCategoriesAndItems = [];

      for (var categoryData in dummyData) {
        List<Map<String, dynamic>> subCategories =
            categoryData['subCategories'];

        for (var subCategoryData in subCategories) {
          String currentSubCategoryName = subCategoryData['subCategoryName'];

          if (currentSubCategoryName == subcategoryName) {
            List<Map<String, dynamic>> items = subCategoryData['items'];

            for (var itemData in items) {
              Map<String, dynamic> newItem = {
                'subCategoryName': currentSubCategoryName,
                'itemName': itemData['itemName'],
                'itemPrice': itemData['itemPrice'],
                'itemImage': itemData['itemImage'],
              };

              subCategoriesAndItems.add(newItem);
            }
          }
        }
      }

      return subCategoriesAndItems;
    }
  }

  Widget buildGridView(int tabIndex) {
    List<Map<String, dynamic>> itemsToShow = filterDataByTab(tabIndex);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: itemsToShow.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> itemData = itemsToShow[index];

        return PortraitCard(
          itemName: itemData['itemName'],
          itemPrice: itemData['itemPrice'],
          subCategoryName: itemData['subCategoryName'],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: MyColors.black1,
          backgroundColor: MyColors.black1,
          leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Categories();
                },
              ));
            },
            child: CircleAvatar(
              backgroundColor: MyColors.black1,
              child: Icon(
                Icons.arrow_back,
                color: MyColors.black20,
              ),
            ),
          ),
          title: Text(
            getTitle(),
            style: TextStyle(color: MyColors.black100),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonsTabBar(
                  contentPadding: EdgeInsets.all(10),
                  controller: tabbarcontroller,
                  backgroundColor: MyColors.yellowD,
                  unselectedBackgroundColor: MyColors.black10,
                  unselectedLabelStyle: TextStyle(color: MyColors.black100),
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: MyColors.black1,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: [
                    Tab(
                      text: "${dummyData[0]["category"]}",
                    ),
                    Tab(
                      text: "${dummyData[1]["category"]}",
                    ),
                    Tab(
                      text: "${dummyData[2]["category"]}",
                    ),
                    Tab(
                      text: "${dummyData[3]["category"]}",
                    ),
                    Tab(
                      text: "${dummyData[4]["category"]}",
                    ),
                    Tab(
                      text: "${dummyData[5]["category"]}",
                    ),
                    Tab(
                      text: "${dummyData[6]["category"]}",
                    ),
                    Tab(
                      text: "All",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabbarcontroller,
                  children: [
                    buildGridView(0),
                    buildGridView(1),
                    buildGridView(2),
                    buildGridView(3),
                    buildGridView(4),
                    buildGridView(5),
                    buildGridView(6),
                    buildGridView(7), // Show all items for the "All" tab
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
