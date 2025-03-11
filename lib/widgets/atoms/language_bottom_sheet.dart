import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';
import 'package:whatsapp_clone/controllers/language_controller.dart';

class LanguageBottomSheet {
  static void showLanguageSheet() {
    final theme = Theme.of(Get.context!); // Get current theme

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.customBackground, // Theme-based background
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: GetBuilder<LanguageController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Language',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.customText),
                ),
                const SizedBox(height: 10),
                _buildLanguageOption(controller, 'English', theme),
                _buildLanguageOption(controller, 'Spanish', theme),
                _buildLanguageOption(controller, 'French', theme),
              ],
            );
          },
        ),
      ),
    );
  }

  static Widget _buildLanguageOption(LanguageController controller, String language, ThemeData theme) {
    return ListTile(
      title: Text(language, style: TextStyle(color: theme.customText)),
      trailing: controller.selectedLanguage.value == language
          ? Icon(Icons.check, color: tealGreen)
          : null,
      onTap: () {
        controller.changeLanguage(language);
        Get.back(); // Close the bottom sheet
      },
    );
  }
}
