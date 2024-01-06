import 'dart:math';

import 'package:chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'constants.dart';

import 'view/widgets/chat_bubble.dart';
import 'view/widgets/custom_text.dart';
import 'view/widgets/custom_text_form.dart';

class ChatPage extends StatelessWidget {
  String? email;
  ChatPage({required this.email});
  final listViewController = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  String? data;
  void sendMessage(data) {
    messages.add({kMessage: data, kCreatedAt: DateTime.now(), 'id': email});
    listViewController.animateTo(listViewController.position.maxScrollExtent,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: false).snapshots(),
        builder: (builder, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (var element in snapshot.data!.docs) {
              messagesList.add(Message.fromJson(element));
            }
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  gradient: kGradient,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 5, top: 20),
                      child: SizedBox(
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Chat Page',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListView.builder(
                              controller: listViewController,
                              itemCount: messagesList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  messagesList[index].id == email
                                      ? ChatBubble(message: messagesList[index])
                                      : ChatBubbleForFriend(
                                          message: messagesList[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0C000000),
                            blurRadius: 30,
                            offset: Offset(0, -10),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.emoji_emotions),
                          ),
                          Form(
                            key: _formKey,
                            child: Expanded(
                              child: SizedBox(
                                height: 55,
                                child: CustomTextFormFiled(
                                  controller: controller,
                                  onSaved: (value) {
                                    data = value;
                                  },
                                  labelText: 'Type a message',
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _formKey.currentState!.save();

                              sendMessage(data);
                              controller.clear();
                            },
                            icon: const Icon(Icons.send),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
