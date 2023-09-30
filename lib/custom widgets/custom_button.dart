import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final textWidget;
  final buttonBackground;
  final borderRadius;
  final Function() onPressed;
  final width;
  final height;
  final bordercolor;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.buttonBackground,
      required this.borderRadius,
      required this.width,
      required this.height,
      required this.textWidget,
      this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: textWidget,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonBackground),
            shape: MaterialStateProperty.all<OutlinedBorder?>(
                RoundedRectangleBorder(
                    borderRadius: borderRadius, side: BorderSide(width: 0.5)))),
      ),
    );
  }
}
