import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/screens/authorization/signup.dart';
import 'package:whatsapp_clone/screens/main/bottom_navigation/bottom_navigation.dart';
import 'package:whatsapp_clone/widgets/atoms/blur_transparent_card.dart';
import 'package:whatsapp_clone/widgets/atoms/common_textfield.dart';
import 'package:whatsapp_clone/widgets/atoms/elevated_buttons.dart';
import 'package:whatsapp_clone/widgets/atoms/image_background.dart';
import 'package:whatsapp_clone/widgets/atoms/rich_text_widget.dart';

import '../../constants/controller_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBackground(
          child: SafeArea(
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: "App_logo",
                child: Image.asset(imgAppLogo, height: 150),
              ),
            ).paddingOnly(top: 30, bottom: 20),

            // Blur Transparent Card
            BlurBackgroundCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login to your Account",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // Email Field
                  CommonTextField(
                          controller: authController.loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Email",
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.white),
                          fillColor: Color.fromARGB(26, 255, 255, 255),
                          textColor: Colors.white,
                          hintColor: Colors.white70)
                      .paddingOnly(bottom: 10, top: 15),
                  // Password Field
                  CommonTextField(
                          controller: authController.loginPasswordController,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Password",
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.white),
                          fillColor: Color.fromARGB(26, 255, 255, 255),
                          textColor: Colors.white,
                          hintColor: Colors.white70)
                      .paddingOnly(bottom: 20),
                  // Login Button
                  ElevatedTextButton(
                      text: "Login",
                      textColor: Colors.white,
                      buttonColor: Colors.green,
                      borderRadius: 10,
                      onPressed: () =>
                          authController.loginBtn(context: context)),
                  const Text("OR",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )).paddingSymmetric(vertical: 15),
                  // Google Login Button
                  ElevatedIconButton(
                      text: "Continue with Google",
                      textColor: Colors.white,
                      buttonColor: Color.fromARGB(51, 255, 255, 255),
                      borderRadius: 10,
                      onPressed: () {},
                      side: BorderSide(color: Colors.white54),
                      icon: Image.asset(
                        imgGoogleLogo,
                        height: 24,
                      )).paddingOnly(
                    bottom: 10,
                  ),

                  // Signup Link
                  RichTextWidget(
                          text: "Don't have an account? ",
                          linkText: "Sign Up",
                          onTap: () {
                            Get.offAll(() => SignUpPage());
                          },
                          textColor: Colors.white)
                      .paddingSymmetric(vertical: 16),
                ],
              ),
            ).paddingAll(16.0),
          ],
        ),
      )),
    );
  }
}
