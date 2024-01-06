import 'package:flutter/material.dart';

class LineShape extends StatelessWidget {
  const LineShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 2,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
