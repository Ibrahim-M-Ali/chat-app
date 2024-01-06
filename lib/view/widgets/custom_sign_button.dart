// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSignButton extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  const CustomSignButton({
    this.onTap,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
