import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/controllers/image_picker_controller.dart';
import 'package:whatsapp_clone/themes/app_themes.dart'; // Import your controller

Widget bottomSheet(BuildContext context) {
  final ImagePickerController controller = Get.put(ImagePickerController());

  return Container(
    height: 200,
    width: Get.width,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      color: Theme.of(context).customCardColor, // Dynamic background
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    child: Column(
      children: <Widget>[
        Text(
          'Choose Profile Picture',
          style: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).customText, // Dynamic text color
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                IconButton(
                  iconSize: 70,
                  icon: Icon(Icons.camera, color: Theme.of(context).customText),
                  onPressed: () => controller.pickImage(ImageSource.camera),
                ),
                Text('Camera', style: TextStyle(color: Theme.of(context).customText)),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              children: [
                IconButton(
                  iconSize: 70,
                  icon: Icon(Icons.image, color: Theme.of(context).customText),
                  onPressed: () => controller.pickImage(ImageSource.gallery),
                ),
                Text('Gallery', style: TextStyle(color: Theme.of(context).customText)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
