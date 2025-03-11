import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';

Color whiteColor = Colors.white;
var blackColor = Get.isDarkMode?Color(0xff0b1014):Colors.white;
Color tealGreen = Color(0xff008069);
Color greenColor = Colors.green;
Color grayColor = Color(0xff23282c);
Color liteGrayColor = Color(0xff6d7276);




Color blackWhiteColor() {
  return themeController.isDarkMode.value ? blackColor : whiteColor;
}