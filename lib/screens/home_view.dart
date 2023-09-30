// import 'package:flutter/material.dart';
// import 'package:mynewproject/Assets/colors.dart';
// import 'package:mynewproject/Assets/dummy_data.dart';
// import 'package:mynewproject/custom%20widgets/header_home.dart';
// import 'package:mynewproject/custom%20widgets/card_landscape.dart';
// import 'package:mynewproject/custom%20widgets/card_portrait.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         children: [
//           HomePageHeader1(),

//           // -----------------Home page body-----------------------

//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsetsDirectional.symmetric(vertical: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Portrait Cards
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         LandscapeCard(),
//                         LandscapeCard(),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   // Text
//                   Container(
//                       margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
//                       child: const Text(
//                         "Recommended",
//                         style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.w400,
//                             color: MyColors.black100),
//                       )),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   // portrait Cards
//                   // Code is fetching all the item from sub categories
//                   Container(
//                     height: 194,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: (dummyData.length / 3).floor(),
//                       itemBuilder: (context, index) {
//                         final subCategories = dummyData[index]["subCategories"];
//                         final List<Widget> portraitCards = [];

//                         for (var subCategory in subCategories) {
//                           final subCategoryName =
//                               subCategory["subCategoryName"];
//                           final items = subCategory["items"];
//                           final List<Widget> itemCards = [];

//                           for (var item in items) {
//                             final itemName = item["itemName"];
//                             final itemPrice = item["itemPrice"];
//                             final itemImage = item["itemImage"];

//                             itemCards.add(
//                               PortraitCard(
//                                 itemName: itemName,
//                                 itemPrice: itemPrice,
//                                 subCategoryName: subCategoryName,
//                                 itemImage: itemImage,
//                               ),
//                             );
//                           }

//                           portraitCards.addAll(itemCards);
//                         }

//                         return Row(
//                           children: portraitCards,
//                         );
//                       },
//                     ),
//                   ),

//                   const SizedBox(
//                     height: 25,
//                   ),

//                   Container(
//                     height: 194,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: (dummyData.length / 3).floor(),
//                       // reverse: true, // Set reverse to true
//                       itemBuilder: (context, index) {
//                         final subCategories =
//                             dummyData[dummyData.length - 1 - index]
//                                 ["subCategories"]; // Adjust data access
//                         final List<Widget> portraitCards = [];

//                         for (var subCategory in subCategories) {
//                           final subCategoryName =
//                               subCategory["subCategoryName"];
//                           final items = subCategory["items"];
//                           final List<Widget> itemCards = [];

//                           for (var item in items) {
//                             final itemName = item["itemName"];
//                             final itemPrice = item["itemPrice"];
//                             final itemImage = item["itemImage"];

//                             itemCards.add(
//                               PortraitCard(
//                                 itemName: itemName,
//                                 itemPrice: itemPrice,
//                                 subCategoryName: subCategoryName,
//                                 itemImage: itemImage,
//                               ),
//                             );
//                           }

//                           portraitCards.addAll(itemCards);
//                         }

//                         return Row(
//                           children: portraitCards,
//                         );
//                       },
//                     ),
//                   ),

//                   const SizedBox(
//                     height: 25,
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
