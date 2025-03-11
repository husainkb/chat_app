import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/screens/authorization/login.dart';
import 'package:whatsapp_clone/screens/main/bottom_navigation/bottom_navigation.dart';
import 'package:whatsapp_clone/widgets/atoms/image_background.dart';

import '../../../models/user_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    User? res = FirebaseAuth.instance.currentUser;
    debugPrint(res.toString());
    if (res != null) {
      UserModel userModel = UserModel(
        uid: res.uid,
        displayName: res.displayName ?? "",
        email: res.email ?? "",
        phoneNumber: res.phoneNumber ?? "",
        photoURL: res.photoURL ?? "",
      );
      authController.userData.value = userModel;
    }

    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        FirebaseAuth.instance.currentUser == null
            ? Get.offAll(() => const LoginPage(), transition: Transition.fade)
            : Get.offAll(() => BottomNavBar(), transition: Transition.fade);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBackground(
        child: SafeArea(
          child: Center(
            child: Hero(
              tag: "App_logo",
              child: Image.asset(imgAppLogo),
            ),
          ),
        ),
      ),
    );
  }
}
