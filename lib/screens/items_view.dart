import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/Assets/dummy_data.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:mynewproject/custom%20widgets/card_portrait.dart';

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

// ---------------------------------------------
  String getTitle() {
    if (tabbarcontroller.index < dummyData.length) {
      return "${dummyData[tabbarcontroller.index]["category"]}";
    } else {
      return "All";
    }
  }

  // -------------------------------------------------
  Map<String, dynamic> getItemData(int index) {
    List<Map<String, dynamic>> subCategoriesAndItems = [];

    for (var categoryData in dummyData) {
      List<Map<String, dynamic>> subCategories = categoryData['subCategories'];

      for (var subCategoryData in subCategories) {
        List<Map<String, dynamic>> items = subCategoryData['items'];

        if (index < items.length) {
          return {
            'subCategoryName': subCategoryData['subCategoryName'],
            'itemName': items[index]['itemName'],
            'itemPrice': items[index]['itemPrice'],
            'itemImage': items[index]['itemImage'],
          };
        }
      }
    }

    return {}; // Return an empty map if no data found.
  }

// --------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: MyColors.black1,
          backgroundColor: MyColors.black1,
          title: Text(
            getTitle(),
            style: TextStyle(color: MyColors.black100),
          ),
        ),
        body: Column(
          children: [
            ButtonsTabBar(
              contentPadding: EdgeInsets.all(10),
              controller: tabbarcontroller,
              backgroundColor: MyColors.yellowD,
              unselectedBackgroundColor: MyColors.black10,
              unselectedLabelStyle: TextStyle(color: MyColors.black100),
              labelStyle: TextStyle(
                  fontSize: 16,
                  color: MyColors.black1,
                  fontWeight: FontWeight.w400),
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
            Expanded(
              child: TabBarView(
                controller: tabbarcontroller,
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> itemData = getItemData(index);

                      return PortraitCard(
                        itemName: itemData['itemName'],
                        itemPrice: itemData['itemPrice'],
                        subCategoryName: itemData['subCategoryName'],
                      );
                    },
                  ),
                  Center(child: Text("Tab 2 Content")),
                  Center(child: Text("Tab 3 Content")),
                  Center(child: Text("Tab 4 Content")),
                  Center(child: Text("Tab 5 Content")),
                  Center(child: Text("Tab 6 Content")),
                  Center(child: Text("Tab 7 Content")),
                  Center(child: Text("Tab 7 Content")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
