import 'package:chat_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../model/message.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    required this.message,
    super.key,
  });
  Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFF75A9DC), Color(0xFF1A83B8)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(1),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: CustomText(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              text: message.message,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  ChatBubbleForFriend({
    required this.message,
    super.key,
  });
  Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFFCCCCCC), Color(0xFFE7E7E7)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(1),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: CustomText(
              color: Color(0xFF3B3B3B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              text: message.message,
            ),
          ),
        ),
      ),
    );
  }
}
