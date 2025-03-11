import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/screens/main/settings/profile/profile.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';
import 'package:whatsapp_clone/widgets/atoms/language_bottom_sheet.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).customDrawerBG,
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              Get.back();
              Get.to(() => ProfilePage());
            },
            child: DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: Get.width * 0.1,
                  child: Icon(
                    Icons.person,
                    size: Get.width * 0.1,
                  ),
                ).paddingOnly(bottom: 8),
                Text(
                  authController.userData.value.displayName == ""
                      ? "User Name"
                      : authController.userData.value.displayName.toString(),
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  authController.userData.value.email != "" ||
                          authController.userData.value.email != null
                      ? authController.userData.value.email.toString()
                      : "example@gmail.com",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
          ),
          Obx(
            () => settingsListTile(
                title: 'dark_mode'.tr,
                // Use translation key
                subTitle: 'dark_mode_sub'.tr,
                icon: themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
                onTap: () {
                  themeController.toggleTheme();
                  themeController.isDarkMode(Get.isDarkMode);
                },
                textColor: Theme.of(context).customText),
          ),

          // Obx(() => settingsListTile(
          //     title: 'dark_mode'.tr,  // Use translation key
          //     subTitle: 'dark_mode_sub'.tr,
          //     icon: themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
          //     onTap: () {
          //       themeController.toggleTheme();
          //     },
          //     textColor: Theme.of(context).customText),
          // ),

          // settingsListTile(
          //     title: "Privacy",
          //     subTitle: "Block contacts, disappearing messages",
          //     icon: Icons.lock_outlined,
          //     onTap: () {
          //       Get.to(() => PrivacyPage());
          //     },
          //     textColor: Theme.of(context).customText),
          // settingsListTile(
          //     title: "Avatar",
          //     subTitle: "Create, edit, profile photo",
          //     icon: Icons.person_3_rounded,
          //     onTap: () {
          //       Get.to(() => AvatarPage());
          //     },
          //     textColor: Theme.of(context).customText),
          // settingsListTile(
          //     title: "Lists",
          //     subTitle: "Manage people and groups",
          //     icon: Icons.account_box_outlined,
          //     onTap: () {
          //       Get.to(() => ListsPage());
          //     },
          //     textColor: Theme.of(context).customText),
          // settingsListTile(
          //     title: "Chats",
          //     subTitle: "Themes, wallpapers, chat History",
          //     icon: Icons.chat_outlined,
          //     onTap: () {
          //       Get.to(() => ChatsSettingsPage());
          //     },
          //     textColor: Theme.of(context).customText),
          // settingsListTile(
          //     title: "Notifications",
          //     subTitle: "Message, groups & calls tones",
          //     icon: Icons.notifications_none,
          //     onTap: () {
          //       Get.to(() => NotificationsPage());
          //     },
          //     textColor: Theme.of(context).customText),
          // settingsListTile(
          //     title: "Storage and data",
          //     subTitle: "Network usage, auto-download",
          //     icon: Icons.data_saver_off,
          //     onTap: () {
          //       Get.to(() => StorageAndDataPage());
          //     },
          //     textColor: Theme.of(context).customText),
          settingsListTile(
              title: 'language'.tr,
              subTitle: 'language_sub'.tr,
              icon: Icons.language,
              onTap: () {
                // Get.to(() => LanguagesPage());
                LanguageBottomSheet.showLanguageSheet();
              },
              textColor: Theme.of(context).customText),
          settingsListTile(
              title: "Logout",
              subTitle: "Logging Out from the app",
              icon: Icons.logout,
              onTap: () => authController.logoutBtn(context: context),
              textColor: Theme.of(context).customText),
          // settingsListTile(
          //     title: "Help",
          //     subTitle: "Help center, contact us, privacy policy",
          //     icon: Icons.help_outline,
          //     onTap: () {
          //       Get.to(() => HelpPage());
          //     },
          //     textColor: Theme.of(context).customText),
          // settingsListTile(
          //     title: "Invite a friend",
          //     icon: CupertinoIcons.person_2,
          //     onTap: () {
          //       Get.to(() => InviteFriendsPage());
          //     },
          //     textColor: Theme.of(context).customText),
        ],
      ),
    );
  }
}

Widget settingsListTile(
    {required String title,
    String? subTitle,
    required IconData icon,
    required onTap,
    required Color textColor}) {
  return ListTile(
    selectedTileColor: Colors.blue,
    onTap: onTap,
    title: Text(
      title,
      style: TextStyle(
          color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    subtitle: subTitle != null
        ? Text(
            subTitle,
            style: TextStyle(
              color: whiteColor,
              fontSize: 12,
            ),
          )
        : SizedBox.shrink(),
    leading: Icon(
      icon,
      color: whiteColor,
    ),
  );
}
