
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/screens/authorization/login.dart';
import 'package:whatsapp_clone/widgets/atoms/common_textfield.dart';
import 'package:whatsapp_clone/widgets/atoms/elevated_buttons.dart';
import 'package:whatsapp_clone/widgets/atoms/rich_text_widget.dart';

import '../../widgets/atoms/blur_transparent_card.dart';
import '../../widgets/atoms/image_background.dart';
import '../main/bottom_navigation/bottom_navigation.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: ImageBackground(
        child:
            // Content
            SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Hero(
                  tag: "App_logo",
                  child: Image.asset(imgAppLogo, height: 150),
                ),
              ),
              const SizedBox(height: 20),

              // Blur Transparent Card
              BlurBackgroundCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Create Your Account",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    // Name Field
                    CommonTextField(
                            controller: authController.signUpFullNameController,
                            keyboardType: TextInputType.name,
                            hintText: "Full Name",
                            prefixIcon:
                                const Icon(Icons.person, color: Colors.white),
                            fillColor: Color.fromARGB(26, 255, 255, 255),
                            textColor: Colors.white,
                            hintColor: Colors.white70)
                        .paddingOnly(top: 15, bottom: 10),

                    // Phone Number Field
                    CommonTextField(
                        controller: authController.signUpPhoneNumberController,
                        keyboardType: TextInputType.phone,
                        hintText: "Phone Number",
                        prefixIcon:
                            const Icon(Icons.phone, color: Colors.white),
                        fillColor: Color.fromARGB(26, 255, 255, 255),
                        textColor: Colors.white,
                        hintColor: Colors.white70),
                    // Email Field
                    CommonTextField(
                            controller: authController.signUpEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Email",
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.white),
                            fillColor: Color.fromARGB(26, 255, 255, 255),
                            textColor: Colors.white,
                            hintColor: Colors.white70)
                        .paddingSymmetric(vertical: 10),
                    // Password Field
                    CommonTextField(
                            controller: authController.signUpPasswordController,
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Password",
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white),
                            fillColor: Color.fromARGB(26, 255, 255, 255),
                            textColor: Colors.white,
                            hintColor: Colors.white70)
                        .paddingOnly(bottom: 20),

                    // Signup Button
                    ElevatedTextButton(
                        text: "Sign Up",
                        textColor: Colors.white,
                        buttonColor: Colors.green,
                        borderRadius: 10,
                        onPressed: () =>authController.signUpBtn(context: context)),
                    const Text("OR",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )).paddingSymmetric(vertical: 15),
                    // Google Signup Button
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
                    RichTextWidget(
                            text: "Already have an account? ",
                            linkText: "Login",
                            onTap: () {
                              Get.offAll(() => LoginPage());
                            },
                            textColor: Colors.white)
                        .paddingSymmetric(vertical: 16),
                  ],
                ),
              ).paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
