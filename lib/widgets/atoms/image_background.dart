import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';

class ImageBackground extends StatelessWidget {
  final Widget child;

  const ImageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgBackground),
              fit: BoxFit.cover, // Ensures the image covers the container
            ),
          ),
          child: child,
        ));
  }
}