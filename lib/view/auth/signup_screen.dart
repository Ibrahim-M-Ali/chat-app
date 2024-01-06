import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../view-model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  String? name, email, password;
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: InkWell(
          onTap: () {
            Get.off(LoginScreen());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GetBuilder(
          init: AuthViewModel(),
          builder: (controller) => Center(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey2,
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Sign Up",
                      fontWeight: FontWeight.w600,
                      color: kLightBlack,
                      fontSize: 36,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      fontSize: 14,
                      color: Color(0xFF888888),
                      text:
                          'Let’s get you all set up so you can verify your personal account and begin setting up your profile',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          color: kLightBlack,
                          text: "Full Name",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormFiled(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            name = value;
                          },
                          labelText: "Full Name",
                        ),
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
                          onSaved: (value) {
                            email = value;
                          },
                          labelText: "Email",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomText(
                          color: kLightBlack,
                          text: "Password",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormFiled(
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
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: CustomButton(
                            onPressed: () {
                              _formKey2.currentState!.save();
                              if (_formKey2.currentState!.validate()) {
                                controller.createAccountWithEmailAndPassword(
                                    name!, email!, password!);
                              }
                            },
                            text: 'Sign Up',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: 'Already have an account?',
                                color: kLightBlack,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(LoginScreen());
                                },
                                child: const CustomText(
                                  text: 'Sign In',
                                  fontWeight: FontWeight.w600,
                                  color: kLightBlack,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
