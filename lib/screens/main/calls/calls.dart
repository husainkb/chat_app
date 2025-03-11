import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/screens/main/calls/call_details.dart';
import 'package:whatsapp_clone/screens/main/calls/widgets.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.green,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.delete, // Added missing icon
                color: Colors.white,
              ),
              label: 'Clear Call Logs',
              onTap: () {},
            ),
          ],
        ).paddingOnly(bottom: 100),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorites",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).customText),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                ).paddingOnly(right: 10),
                Text(
                  "Add favorite",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).customText),
                ),
              ],
            ).paddingSymmetric(vertical: 12),
            Text(
              "Recent",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).customText),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Get.to(() => CallsDetailsPage());
                      },
                      child: callsCard(
                          context: context,
                          index: index,
                          textColor: Theme.of(context).customText));
                })
          ],
        ).paddingAll(12),
      ),
    );
  }
}
