import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

class CommunitiesPage extends StatelessWidget {
  const CommunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(imgCommunity, height: 150, width: 150),
          ),
          Text(
            "Stay connected with a community",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).customText),
          ).paddingOnly(bottom: 10, top: 16),
          Text(
            "Communities bring members together in topic-based groups, and make it easy yo get admin announcement. Any community you're added to will appear hear.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).customText),
          ).paddingSymmetric(horizontal: 16),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "See example communities",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.blue,
                )
              ],
            ),
          ).paddingOnly(top: 10, bottom: 20),
          SizedBox(
              height: 35,
              width: double.infinity,
              child: FilledButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green)),
                  child: Text(
                    "Start your community",
                    style: TextStyle(color: Colors.black),
                  ))).paddingAll(16)
        ],
      ).paddingAll(16),
    );
  }
}
