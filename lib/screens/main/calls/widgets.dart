import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';

Widget callsCard({required BuildContext context, required int index, required Color textColor}) {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          imgUserLogo, fit: BoxFit.cover,
          height: 40,
          width: 40,
        ),
      ).paddingOnly(right: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Username/ Number / Group Name Username/ Number / Group Name Username/ Number / Group Name",
              style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ).paddingOnly(right: 8).paddingOnly(bottom: 2),
            Row(
              children: [
                Image.asset(
                  index % 2 == 0 ? icTopRightArrow : icDownLeftArrow,
                  color: index % 2 == 0 ? Colors.green : Colors.red,
                  height: 14,
                  width: 14,
                ),
                Text(
                  "January 25, 7:42 PM",
                  style: TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      color: tealGreen),
                  maxLines: 1,
                ).paddingOnly(right: 8),
              ],
            ),
          ],
        ),
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            index % 2 == 0 ? Icons.call_outlined : Icons.videocam_outlined,
            color: textColor,
          )),
    ],
  ).paddingSymmetric(vertical: 12);
}
