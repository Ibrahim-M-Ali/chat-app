import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const CustomText(text: 'Welcome', fontSize: 26),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: 'Enjoy the experience.',
              color: Color(0xFF919191),
              fontSize: 20,
            ),
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              color: primaryColor,
              text: 'Login',
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                color: Colors.grey.shade100,
                text: 'Sign Up',
                textColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
