import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';

class ImagePickerController extends GetxController {
  var selectedImage = Rx<File?>(null);

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      profileController.profileImageUrl.value = pickedFile.path;
      // await profileController.uploadProfileImage(file: File(pickedFile.path));
      selectedImage.value = File(pickedFile.path);
      Get.back();
    }
  }
}
