import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // -------------------------------------APP BAR------------------
      appBar: AppBar(
        shadowColor: MyColors.black10,
        iconTheme: IconThemeData(
          color: MyColors.black100, // Change this color to your desired color
        ),
        backgroundColor: MyColors.black1,
        title: Text(
          "Orders",
          style: TextStyle(color: MyColors.black100),
        ),
      ),
      // -----------------------------------body---------------------------
    ));
  }
}
