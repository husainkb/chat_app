
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/controllers/language_controller.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'root.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
// ...

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  themeController.isDarkMode(Get.isDarkMode);
  Get.put(LanguageController());
  await GetStorage.init();
  runApp(const Root());
}



