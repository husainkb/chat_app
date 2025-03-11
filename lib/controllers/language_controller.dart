import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'English'.obs;

  Locale get selectedLocale {
    return selectedLanguage.value == 'English' ? Locale('en') :
    selectedLanguage.value == 'Spanish' ? Locale('es') :
    Locale('fr'); // Defaulting to French if not English or Spanish
  }

  void changeLanguage(String language) {
    selectedLanguage.value = language;
    var locale = selectedLocale;
    Get.updateLocale(locale);
  }
}
