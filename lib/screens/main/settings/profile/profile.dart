import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';
import 'package:whatsapp_clone/widgets/atoms/camera_bottom_sheet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    debugPrint(authController.userData.value.phoneNumber.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                // Get.bottomSheet(
                //   bottomSheet(context),
                //   backgroundColor:
                //       Theme.of(context).customCardColor, // Ensure it's visible
                //   shape: RoundedRectangleBorder(
                //     borderRadius:
                //         BorderRadius.vertical(top: Radius.circular(20)),
                //   ),
                // );
                profileController.uploadProfileImage(context: context);
              },
              child: Obx(
                () => Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Get.width * 0.15),
                      child: authController.userData.value.photoURL != ""
                          ? Image.network(
                              authController.userData.value.photoURL,
                              height: (Get.width * 0.15) * 2,
                              width: (Get.width * 0.15) * 2,
                              fit: BoxFit.cover,
                            )
                          : profileController.profileImageUrl.value.isNotEmpty
                              ? Image.file(
                                  File(profileController.profileImageUrl.value),
                                  height: (Get.width * 0.15) * 2,
                                  width: (Get.width * 0.15) * 2,
                                  fit: BoxFit.cover,
                                )
                              : CircleAvatar(
                                  radius: Get.width * 0.15,
                                  child: Icon(
                                    Icons.person,
                                    size: Get.width * 0.15,
                                  ),
                                ),
                    ).paddingOnly(right: 12),
                    Positioned(
                        bottom: 0,
                        right: 5,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: Get.width * 0.05,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: Get.width * 0.05,
                            color: Colors.black,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ).paddingSymmetric(vertical: 16),
          profileListTile(
              title: "Name",
              subTitle: authController.userData.value.displayName ??
                  " User your name",
              icon: CupertinoIcons.person,
              textColor: Theme.of(context).customText),
          profileListTile(
              title: "Email",
              subTitle:
                  authController.userData.value.email ?? "Enter your Email",
              icon: Icons.email_outlined,
              textColor: Theme.of(context).customText),
          profileListTile(
              title: "Phone",
              subTitle: authController.userData.value.phoneNumber == ""
                  ? "Enter the phone number"
                  : authController.userData.value.phoneNumber,
              icon: Icons.call_outlined,
              textColor: Theme.of(context).customText),
        ],
      ),
    );
  }
}

Widget profileListTile(
    {required String title,
    String? subTitle,
    required IconData icon,
    required Color textColor}) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
          color: textColor, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    subtitle: subTitle != null
        ? Text(
            subTitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          )
        : SizedBox.shrink(),
    leading: Icon(icon),
  );
}
