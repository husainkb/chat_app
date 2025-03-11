import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/bindings/main_bindings.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/controllers/language_controller.dart';
import 'package:whatsapp_clone/localization/app_translation.dart';
import 'package:whatsapp_clone/screens/app_boarding/splash/splash.dart';
import 'package:whatsapp_clone/screens/main/bottom_navigation/bottom_navigation.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';


class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBindings(),
      themeMode: themeController.theme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      locale: Get.find<LanguageController>().selectedLocale, // Bind the selected locale
      fallbackLocale: Locale('en', 'US'), // Default fallback locale
      translations: AppTranslations(), // Define translations
      home: const SplashPage(),
    );

  }
}