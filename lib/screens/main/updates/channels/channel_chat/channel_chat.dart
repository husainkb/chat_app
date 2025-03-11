import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/screens/main/chats/users/user_details.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';
import 'package:custom_clippers/custom_clippers.dart';

class ChannelChatPage extends StatelessWidget {
  final int index;
  const ChannelChatPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ).paddingSymmetric(horizontal: 5),
        ),
        // leadingWidth: 20,

        title: InkWell(
          onTap: () {
            Get.to(() => UserDetailsPage(), transition: Transition.fade);
          },
          splashColor: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: 'profile',
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        imgUserLogo,
                      ),
                    ),
                  ),
                ),
              ).paddingOnly(right: 12),
              Text(
                "Martin",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          Icon(
            Icons.call_outlined,
            size: 24,
          ).paddingSymmetric(horizontal: 10),
          Icon(
            CupertinoIcons.video_camera,
            size: 30,
          ).paddingOnly(right: 10),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12)),
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).customTextFieldBG,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                      style: TextStyle(
                          color: Theme.of(context).customText, fontSize: 13),
                      onChanged: (val) {}, // Call filter function
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 6),

                        fillColor: grayColor,
                        hintText: 'Search',

                        hintStyle: TextStyle(
                            color: Theme.of(context).customTextFieldHint,
                            fontSize: 13),
                        prefixIcon: Image.asset(
                          icFileEmoji,
                          color: Theme.of(context).customTextFieldHint,
                          height: 20,
                          width: 20,
                        ).paddingOnly(left: 8, top: 10, bottom: 10),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.paperclip,
                              color: Theme.of(context).customTextFieldHint,
                              size: 20,
                            ),
                            Icon(
                              Icons.currency_rupee_rounded,
                              color: Theme.of(context).customTextFieldHint,
                              size: 20,
                            ).paddingSymmetric(horizontal: 8),
                            Icon(
                              CupertinoIcons.camera,
                              color: Theme.of(context).customTextFieldHint,
                              size: 20,
                            ),
                          ],
                        ).paddingOnly(right: 16),
                        border: InputBorder.none,
                        // No border
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 8),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.mic),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          ClipPath(
            clipper: UpperNipMessageClipper(MessageType.send, sizeRatio: 4),
            child: Container(
              // height: 100,
              padding: EdgeInsets.all(16),
              color: Colors.red.shade300,
              alignment: Alignment.center,
              child: Text(
                'Multiple Points Clipper Bottom Only',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 4),
            ),
          )
              .paddingSymmetric(
            vertical: 10,
          )
              .marginOnly(left: Get.width * 0.4),
          ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive, sizeRatio: 4),
            child: Container(
              // height: 100,
              padding: EdgeInsets.all(16),
              color: Colors.green.shade100,
              alignment: Alignment.center,
              child: Text(
                'Multiple Points Clipper Bottom Only',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ).paddingOnly(top: 4),
            ),
          ).paddingSymmetric(vertical: 10).marginOnly(right: Get.width * 0.4),
        ],
      ),
    );
  }
}
