import '../../view-model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';

import '../widgets/line_shape.dart';
import 'signup_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_sign_button.dart';
import '../widgets/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/custom_text_form.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  String? email, password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  color: kLightBlack,
                  text: "Sign in",
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  fontSize: 14,
                  color: Color(0xFF888888),
                  text:
                      'Welcome, please put your login credentials below to start using the app',
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      color: kLightBlack,
                      text: "Email",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormFiled(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vaild Email';
                        }
                        return null;
                      },
                      labelText: "Email",
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomText(
                      color: kLightBlack,
                      text: "Password",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AuthViewModel>(
                      builder: (controller) => CustomTextFormFiled(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter vaild Password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                        labelText: "Password",
                        obscureText: controller.obscureText,
                        icon: IconButton(
                          color: kLightBlack,
                          onPressed: () {
                            controller.showPassword();
                          },
                          icon: const Icon(
                            FontAwesomeIcons.eyeSlash,
                            color: kLightBlack,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: CustomButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            controller.signInWithEmailAndPassword(
                                email!, password!);
                          }
                        },
                        text: 'Sign in',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LineShape(),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(text: 'Or continue with '),
                        SizedBox(
                          width: 10,
                        ),
                        LineShape(),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: CustomSignButton(
                        onTap: () {
                          controller.signInWithGoogle();
                        },
                        icon: FontAwesomeIcons.google,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: 'Don\'t have an account?',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(SignupScreen());
                            },
                            child: const CustomText(
                              text: 'Register now',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
