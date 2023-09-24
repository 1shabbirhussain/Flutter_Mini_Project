import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubCategoryCards extends StatefulWidget {
  final String subCategoryName;
  final String subCategoryOrigin;
  final String PerKg;
  final String subCategoryImage;
  final VoidCallback onTap;
  // final void Function()? onTap; // to navigate on screen sub cat items
  const SubCategoryCards({
    super.key,
    required this.subCategoryName,
    required this.subCategoryOrigin,
    required this.PerKg,
    required this.subCategoryImage,
    required this.onTap,
  });

  @override
  State<SubCategoryCards> createState() => _SubCategoryCardsState();
}

class _SubCategoryCardsState extends State<SubCategoryCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 180,
        width: 299,
        color: Colors.white,
        child: Row(
          children: [
            Container(
                height: 167,
                width: 137,
                // color: const Color.fromARGB(255, 59, 131, 255),
                decoration: BoxDecoration(
                    color: Color(0xffFFDC83),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 98,
                      width: 98,
                      color: Color(0xffFFDC83),
                      child: Image.asset(widget.subCategoryImage),
                    ),
                  ],
                )),
            SizedBox(
              width: 15,
            ),
            Container(
              height: 167,
              width: 140,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.subCategoryName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.subCategoryOrigin,
                      style: TextStyle(fontSize: 12)),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Starting From",
                      style: TextStyle(
                        fontSize: 10,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.PerKg,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2A4BA0)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
