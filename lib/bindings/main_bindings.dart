

import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/theme_controller.dart';



class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ThemeController());
  }
}