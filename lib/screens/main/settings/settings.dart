import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart' ;
import 'package:whatsapp_clone/screens/main/settings/account/account.dart';
import 'package:whatsapp_clone/screens/main/settings/avatar/avatar.dart';
import 'package:whatsapp_clone/screens/main/settings/chats_settings/chats_settings.dart';
import 'package:whatsapp_clone/screens/main/settings/help/help.dart';
import 'package:whatsapp_clone/screens/main/settings/invite_friend/invite_friend.dart';
import 'package:whatsapp_clone/screens/main/settings/language/languages.dart';
import 'package:whatsapp_clone/screens/main/settings/list/lists.dart';
import 'package:whatsapp_clone/screens/main/settings/notifications/notifications.dart';
import 'package:whatsapp_clone/screens/main/settings/privacy/privacy.dart';
import 'package:whatsapp_clone/screens/main/settings/profile/profile.dart';
import 'package:whatsapp_clone/screens/main/settings/storage_and_data/storage_and_data.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 24,)),

        title: Text(
          "Settings Page",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.search,color: Colors.white,size: 24,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.to(()=>ProfilePage());
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    child: Icon(Icons.person),
                  ).paddingOnly(right: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Pranay Jaulkar",
                        style: TextStyle(
                            color: Theme.of(context).customText, fontSize: 16, fontWeight: FontWeight.bold),
                      ).paddingOnly(bottom: 5),
                      Text(
                        "Available",
                        style: TextStyle(
                            color: tealGreen, fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner,color: Colors.green,size: 24,)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline,color: Colors.green,size: 24,)),
                    ]
                  )
                ],
              ).paddingSymmetric(horizontal: 16,vertical: 12),
            ),
            Divider(),
            settingsListTile(title: "Account", subTitle: "Security notifications, change number", icon: Icons.key, onTap: (){
              Get.to(()=>AccountPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "Privacy", subTitle: "Block contacts, disappearing messages", icon: Icons.lock_outlined,onTap: (){
              Get.to(()=>PrivacyPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "Avatar", subTitle: "Create, edit, profile photo", icon: Icons.person_3_rounded,onTap: (){
              Get.to(()=>AvatarPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "Lists", subTitle: "Manage people and groups", icon: Icons.account_box_outlined,onTap: (){
              Get.to(()=>ListsPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "Chats", subTitle: "Themes, wallpapers, chat History", icon: Icons.chat_outlined,onTap: (){
              Get.to(()=>ChatsSettingsPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "Notifications", subTitle: "Message, groups & calls tones", icon: Icons.notifications_none,onTap: (){
              Get.to(()=>NotificationsPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "Storage and data", subTitle: "Network usage, auto-download", icon: Icons.data_saver_off,onTap: (){
              Get.to(()=>StorageAndDataPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "App Language", subTitle: "English (device's language), change number", icon: Icons.language,onTap: (){
              Get.to(()=>LanguagesPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "Help", subTitle: "Help center, contact us, privacy policy", icon: Icons.help_outline,onTap: (){
              Get.to(()=>HelpPage());
            },textColor: Theme.of(context).customText),
            settingsListTile(title: "Invite a friend",  icon: CupertinoIcons.person_2 ,onTap: (){
              Get.to(()=>InviteFriendsPage());
            },textColor: Theme.of(context).customText),
            Text(
              "Also From Meta",
              style: TextStyle(
                color: tealGreen,
                fontSize: 16,
              fontWeight: FontWeight.bold),
            ).paddingOnly(left: 16,bottom: 16),
            ListTile(
              title: Text(
                "Open Instagram",
                style: TextStyle(
                    color: Theme.of(context).customText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),

              leading: Icon(Icons.account_box),
            ),
            ListTile(
              title: Text(
                "Open Facebook",
                style: TextStyle(
                    color: Theme.of(context).customText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),

              leading: Icon(Icons.account_box),
            ),
            ListTile(
              title: Text(
                "Open Threads",
                style: TextStyle(
                    color: Theme.of(context).customText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),

              leading: Icon(Icons.account_box),
            )
          ],
        ),
      ),
    );
  }
}


Widget settingsListTile ({required String title, String? subTitle, required IconData icon, required onTap,required Color textColor} ){
  return ListTile(
    onTap: onTap,
    title: Text(
      title,
      style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold),
    ),
    subtitle: subTitle!= null?Text(
      subTitle,
      style: TextStyle(
        color: tealGreen,
        fontSize: 12,),
    ):SizedBox.shrink(),
    leading: Icon(icon),
  );
}