import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

Widget chatsCard(
    {required BuildContext context,
    required int index,
    required Color textColor}) {
  return Stack(
    children: [
      Card(
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  imgUserLogo,
                  fit: BoxFit.cover,
                  height: 48,
                  width: 48,
                )).paddingOnly(right: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        "Username/ Number / Group Name Username/ Number / Group Name Username/ Number / Group Name",
                        style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ).paddingOnly(right: 8)),
                      // Text(
                      //   "9:20 AM",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w500,
                      //       fontSize: 12,
                      //       color: Colors.green),
                      // ),
                    ],
                  ).paddingOnly(bottom: 2, top: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        "Username/ Number / Group Name Username/ Number / Group Name Username/ Number / Group Name",
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: tealGreen),
                        maxLines: 1,
                      ).paddingOnly(right: 8)),
                      Icon(
                        Icons.push_pin,
                        color: tealGreen,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 12),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "9:20 AM",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.green),
            ).paddingOnly(right: 5, top: 3),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
              ),
              child: Text(
                "1",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      )
    ],
  ).paddingAll(10);
}


class ChatCard extends StatelessWidget {
  final BuildContext context;
  final int index;
  final Color textColor;
  const ChatCard({super.key, required this.context, required this.index, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: Theme.of(context).customBackground,
          shadowColor: Theme.of(context).customText,
          elevation: 6,
          margin: EdgeInsets.zero,
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    imgUserLogo,
                    fit: BoxFit.cover,
                    height: 48,
                    width: 48,
                  )).paddingOnly(right: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                              "Username/ Number / Group Name Username/ Number / Group Name Username/ Number / Group Name",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).customText,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ).paddingOnly(right: 8)),
                        // Text(
                        //   "9:20 AM",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 12,
                        //       color: Colors.green),
                        // ),
                      ],
                    ).paddingOnly(bottom: 2, top: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                              "Username/ Number / Group Name Username/ Number / Group Name Username/ Number / Group Name",
                              style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  color: tealGreen),
                              maxLines: 1,
                            ).paddingOnly(right: 8)),
                        Icon(
                          Icons.push_pin,
                          color: tealGreen,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 12),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "9:20 AM",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.green),
              ).paddingOnly(right: 5, top: 3),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                ),
                child: Text(
                  "1",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        )
      ],
    ).paddingAll(10);
  }
}
