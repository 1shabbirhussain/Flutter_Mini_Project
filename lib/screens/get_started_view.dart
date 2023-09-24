import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/custom%20widgets/bottom_navbar_view.dart';
import 'package:mynewproject/custom%20widgets/custom_button.dart';
import 'package:mynewproject/screens/home_view.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  List pageNumber = ["one", "two"];

  PageController pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: PageView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      controller: pageViewController,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          //Main container background color dene k liye use kia
          color: MyColors.blueL,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                //header ka sara text or navigations lines yahan use ki
                children: [
                  Container(
                    width: 250,
                    height: 203,
                    alignment: Alignment(0.0, 0.5),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "Your holiday shopping delivered to Screen ${pageNumber[index]} ",
                            style: const TextStyle(
                              color: MyColors.black1,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Image.network("images/Emoji.png"),
                        )),
                      ]),
                    ),
                  ),
                  Container(
                    width: 272,
                    child: Text(
                      "There's something for everyone to enjoy with Sweet Shop Favourites Screen ${index + 1}",
                      style: const TextStyle(
                          color: MyColors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 272,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () => {
                                  pageViewController.previousPage(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.bounceOut)
                                },
                            child: Image.asset(
                              "images/Line2.png",
                            )),
                        Container(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () => {
                                  pageViewController.nextPage(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.bounceOut)
                                },
                            child: Image.asset(
                              "images/Line1.png",
                            )),
                        // IconButton(
                        //     onPressed: () => {
                        //           pageViewController.previousPage(
                        //               duration: const Duration(seconds: 1),
                        //               curve: Curves.easeInQuint)
                        //         },
                        //     icon: const Icon(
                        //       Icons.remove,
                        //       color: MyColors.black45,
                        //     )),
                        // IconButton(
                        //     onPressed: () => {
                        //           pageViewController.nextPage(
                        //               duration: const Duration(seconds: 1),
                        //               curve: Curves.easeInOutQuint)
                        //         },
                        //     icon: const Icon(
                        //       Icons.remove,
                        //       color: MyColors.black20,
                        //     )),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 272,
                child: Image.network("images/ImageIcon.png"),
              ),
              Container(
                  width: 272,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NavbarView();
                      }));
                    },
                    buttonBackground: MyColors.black1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    width: 253,
                    height: 70,
                    textWidget: const Text(
                      "Get Started                         ->",
                      style: TextStyle(
                          color: MyColors.black100,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ],
          ),
        );
      },
    )));
  }
}
