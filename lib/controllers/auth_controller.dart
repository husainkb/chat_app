import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/screens/authorization/login.dart';
import 'package:whatsapp_clone/screens/main/bottom_navigation/bottom_navigation.dart';
import 'package:whatsapp_clone/utils/app_utils.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpFullNameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpPhoneNumberController = TextEditingController();

  var userData = UserModel().obs;

  void loginBtn({required BuildContext context}) {
    if (loginIsEmpty(context: context)) {
      signIn(context: context);
    }
  }

  void signUpBtn({required BuildContext context}) {
    if (signUpEmpty(context: context)) {
      signUp(context: context);
    }
  }

  Future<void> signUp({required BuildContext context}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      );
      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(signUpFullNameController.text);
        await user.reload();
        user = auth.currentUser;
        if (user != null) {
          UserModel userModel = UserModel(
            uid: user.uid,
            displayName: user.displayName ?? "",
            email: user.email ?? "",
            phoneNumber: user.phoneNumber ?? "",
            photoURL: user.photoURL ?? "",
          );
          userData.value = userModel;
        }

        showToast(context, "Account created successfully");
        Get.offAll(() => BottomNavBar());
      }
    } on FirebaseAuthException catch (e) {
      showToast(context,  e.message ?? "Something went wrong");
    }
  }

  Future<void> signIn({required BuildContext context}) async {
    try {
      var response = await auth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      debugPrint(response.toString());
      User? user = response.user;

      if (user != null) {
        await user.updateDisplayName(signUpFullNameController.text);
        await user.reload();
        user = auth.currentUser;
        if (user != null) {
          UserModel userModel = UserModel(
            uid: user.uid,
            displayName: user.displayName ?? "",
            email: user.email ?? "",
            phoneNumber: user.phoneNumber ?? "",
            photoURL: user.photoURL ?? "",
          );
          userData.value = userModel;
        }

        Get.offAll(() => BottomNavBar());
        showToast(context, "Successfully Logged In");
      }
    } on FirebaseAuthException catch (e) {
      showToast(context, e.message ?? "Something went wrong");
    }
  }

  Future<void> logoutBtn({required BuildContext context}) async {
    try {
      await auth.signOut();
      showToast(context, "Logged out successfully!");
      Get.offAll(() => LoginPage());
    } catch (e) {
      showToast(context, "Logout failed: ${e.toString()}");
    }
  }

  bool loginIsEmpty({required BuildContext context}) {
    if (loginEmailController.text.isEmpty) {
      showToast(context, "Enter your email address");
      return false;
    }
    if (loginPasswordController.text.isEmpty) {
      showToast(context, "Enter the password");
      return false;
    }
    return true;
  }

  bool signUpEmpty({required BuildContext context}) {
    if (signUpFullNameController.text.isEmpty) {
      showToast(context, "Enter the password");
      return false;
    }
    if (signUpPhoneNumberController.text.isEmpty) {
      showToast(context, "Enter the password");
      return false;
    }
    if (signUpEmailController.text.isEmpty) {
      showToast(context, "Enter your email address");
      return false;
    }
    if (signUpPasswordController.text.isEmpty) {
      showToast(context, "Enter the password");
      return false;
    }

    return true;
  }
}
