import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  var selectedTab = "Calls".obs;
  var isSearch = false.obs;

}