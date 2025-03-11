import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/utils/app_utils.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  RxString profileImageUrl = "".obs;

  /// Update user profile details in Firestore
  Future<void> updateProfile(
      {String? name, String? email, String? phone}) async {
    try {
      String userId = authController.userData.value.uid.toString();
      await _firestore.collection('users').doc(userId).update({
        if (name != null) "displayName": name,
        if (email != null) "email": email,
        if (phone != null) "phoneNumber": phone,
      });

      Get.snackbar("Success", "Profile updated successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to update profile: $e");
    }
  }

  /// Upload profile image to Firebase Storage
  Future<void> uploadProfileImage({required BuildContext context}) async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      File file = File(pickedFile.path);
      String userId = authController.userData.value.uid.toString();
      String filePath = "profile_images/$userId.jpg";

      TaskSnapshot uploadTask = await _storage.ref(filePath).putFile(file);
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('users')
          .doc(userId)
          .update({"photoURL": imageUrl});
      profileImageUrl.value = imageUrl;

      showToast(context, "Profile image updated!");
      Get.back();
    } catch (e) {
      showToast(context, "Failed to upload profile image: $e");
    }
  }
}
