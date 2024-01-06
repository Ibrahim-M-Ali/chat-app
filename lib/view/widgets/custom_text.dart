// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;

  const CustomText({
    this.fontWeight,
    this.text = "",
    this.fontSize = 16,
    this.color = Colors.black,
    this.maxLines,
    this.overflow,
    this.height,
    this.textDecoration = TextDecoration.none,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      maxLines: maxLines,
      text,
      textAlign: textAlign,
      style: TextStyle(
        decoration: textDecoration,
        fontFamily: 'Poppins',
        height: height,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
