// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final IconButton? icon;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  const CustomTextFormFiled({
    required this.labelText,
    this.obscureText = false,
    this.icon,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 80,
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        cursorHeight: 20,
        cursorColor: kLightBlack,
        // controller: controller,
        decoration: InputDecoration(
          fillColor: Color(0xFFF6F6F6),
          suffixIcon: icon,
          filled: true,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFFC4C4C4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFFD6D6D6), width: 0.5),
          ),
        ),
      ),
    );
  }
}
