import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/Assets/dummy_data.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:mynewproject/custom%20widgets/card_portrait.dart';
import 'package:mynewproject/screens/cart_view.dart';

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
      // For other tabs, return items for the specific category and all its subcategories
      List<Map<String, dynamic>> itemsToShow = [];
      if (tabIndex >= 0 && tabIndex < dummyData.length) {
        List<Map<String, dynamic>> categoryData =
            dummyData[tabIndex]['subCategories'];
        for (var subCategoryData in categoryData) {
          List<Map<String, dynamic>> items = subCategoryData['items'];
          for (var itemData in items) {
            Map<String, dynamic> newItem = {
              'subCategoryName': subCategoryData['subCategoryName'],
              'itemName': itemData['itemName'],
              'itemPrice': itemData['itemPrice'],
              'itemImage': itemData['itemImage'],
            };
            itemsToShow.add(newItem);
          }
        }
      }
      return itemsToShow;
    }
  }

  Widget buildGridView(int tabIndex) {
    List<Map<String, dynamic>> itemsToShow = filterDataByTab(tabIndex);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // crossAxisSpacing: ,
        mainAxisSpacing: 20,
      ),
      itemCount: itemsToShow.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> itemData = itemsToShow[index];

        return PortraitCard(
          itemName: itemData['itemName'],
          itemPrice: itemData['itemPrice'],
          subCategoryName: itemData['subCategoryName'],
          itemImage: itemData['itemImage'],
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
          iconTheme: IconThemeData(
            color: MyColors.black45, // Change this color to your desired color
          ),
          title: Text(
            getTitle(),
            style: TextStyle(color: MyColors.black100),
          ),
          actions: [
            // Icon(Icons.ac_unit_outlined)
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),

              // -----------------------------CART BADGE START--------------------

              child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CartView();
                        },
                      ),
                    );
                    setState(() {});
                  },
                  child: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: MyColors.yellowD,
                      padding: EdgeInsets.all(3),
                    ),
                    badgeContent: Text("${cartItems.length}"),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: MyColors.black100,
                      size: 20,
                    ),
                  )),
              // -----------------------------CART BADGE END--------------------
            )
          ],
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
