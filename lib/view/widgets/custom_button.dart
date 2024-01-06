// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final void Function()? onPressed;
  final FontWeight? fontWeight;
  final double? height;

  const CustomButton({
    this.fontWeight,
    this.height,
    this.onPressed,
    this.text = "",
    this.textColor = Colors.white,
    this.color = primaryColor,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: kGradient,
          borderRadius: BorderRadius.circular(15),
          // color: Colors.amber,
        ),
        width: double.infinity,
        height: 50,
        child: Center(
          child: CustomText(
            color: textColor,
            text: text,
            fontWeight: fontWeight,
            height: height,
          ),
        ),
      ),
    );
  }
}
