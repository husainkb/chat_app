import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

Widget addStatus(
    {required BuildContext context,
    required int index,
    required Color textColor,
    required Color bgColor}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Stack(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(Icons.person),
          ).paddingOnly(top: 12, left: 12, bottom: 5, right: 5),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 11.5,
              backgroundColor: tealGreen,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 10,
                child: Center(
                    child: Icon(
                  Icons.add,
                  size: 15,
                )),
              ),
            ),
          ),
        ],
      ),

      Expanded(
        child: Text(
          "My Status",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ),
    ],
  ).paddingOnly(left: 12, bottom: 5, right: 5);
  Stack(
    children: [
      SizedBox(
        height: 150,
        width: 90,
        child: Card(
          color: tealGreen,
        ),
      ),
      Stack(
        children: [
          CircleAvatar(
            radius: 17,
            child: Icon(Icons.person),
          ).paddingOnly(top: 12, left: 12, bottom: 5, right: 5),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 11.5,
              backgroundColor: tealGreen,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 10,
                child: Center(
                    child: Icon(
                  Icons.add,
                  size: 15,
                )),
              ),
            ),
          ),
        ],
      ),
      Positioned(
        left: 10,
        bottom: 10,
        child: Text(
          "Add Status",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
        ),
      )
    ],
  );
}

Widget statusCard(
    {required BuildContext context,
    required int index,
    required Color textColor,
    required Color bgColor}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
        child: CircleAvatar(
          radius: 28,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset(
              height: 56,
              width: 56,
              imgUserLogo,
              fit: BoxFit.cover, // Optional: Adjust image scaling
            ),
          ),
        ),
      ).paddingOnly(bottom: 6),
      Expanded(
        child: Text(
          "User Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ),
    ],
  ).paddingOnly(top: 12, left: 12, bottom: 5, right: 5);
  //   Stack(
  //   children: [
  //     SizedBox(
  //       height: 150,
  //       width: 90,
  //       child: Card(
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(12),
  //           child: Image.asset(
  //             imgStatus,
  //             fit: BoxFit.cover, // Optional: Adjust image scaling
  //           ),
  //         ),
  //       ),
  //     ),
  //     CircleAvatar(
  //       radius: 19,
  //       backgroundColor: Colors.green,
  //       child: CircleAvatar(
  //         radius: 17,
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(35),
  //           child: Image.asset(
  //             height: 35, width: 35,
  //             imgUserLogo, fit: BoxFit.cover, // Optional: Adjust image scaling
  //           ),
  //         ),
  //       ),
  //     ).paddingOnly(top: 12, left: 12, bottom: 5, right: 5),
  //     Positioned(
  //       left: 10,
  //       bottom: 10,
  //       child: SizedBox(
  //         width: 100, // Ensuring text fits within the card
  //         child: Text(
  //           "User Name",
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //             fontSize: 12,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //           maxLines: 2,
  //         ),
  //       ),
  //     ),
  //   ],
  // );
}
class ChannelCard extends StatelessWidget {
  final BuildContext stateContext;
  final int index;
  const ChannelCard({super.key, required this.stateContext, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180,
          width: Get.width / 3,
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imgStatus,
                fit: BoxFit.cover, // Optional: Adjust image scaling
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 19,
          backgroundColor: Colors.green,
          child: Hero(
            tag: index,
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
          ),
        ).paddingOnly(top: 12, left: 12, bottom: 5, right: 5),

        //   CircleAvatar(
        //     radius: 17,
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(35),
        //       child: Image.asset(
        //         height: 35, width: 35,
        //         imgUserLogo, fit: BoxFit.cover, // Optional: Adjust image scaling
        //       ),
        //     ),
        //   ),
        // ).paddingOnly(top: 12, left: 12, bottom: 5, right: 5),
        Positioned(
          left: 15,
          bottom: 25,
          child: SizedBox(
            width: 100, // Ensuring text fits within the card
            child: Text(
              "User Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
var followChannel = false.obs;

Widget channelFollowCard(
    {required BuildContext context,
    required int index,
    required Color textColor,
    required Color bgColor}) {
  return Row(
    children: [
      CircleAvatar(
        radius: 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            height: 40,
            width: 40,
            imgMoneyControl,
            fit: BoxFit.cover, // Optional: Adjust image scaling
          ),
        ),
      ).paddingOnly(right: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "moneycontrol",
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                ).paddingOnly(right: 8),
                Image.asset(
                  imgBlueTick,
                  height: 14,
                  width: 14,
                )
              ],
            ).paddingOnly(bottom: 2),
            Text(
              "15.6M followers",
              style: TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                  color: tealGreen),
              maxLines: 1,
            ).paddingOnly(right: 8),
          ],
        ),
      ),
      Obx(() => followChannel.value == false
          ? SizedBox(
              height: 30,
              child: FilledButton(
                  onPressed: () {
                    followChannel(!followChannel.value);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff0f3729)),
                    // shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30.0), // Rounded corners
                    //   side: BorderSide(
                    //     color: Colors.green, // Green border color
                    //     width: 1.5, // Border width
                    //   ),
                    // )),
                  ),
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        color: Color(0xffd0f7d5),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )),
            )
          : SizedBox(
              height: 35,
              // width: 90,
              child: FilledButton(
                  onPressed: () {
                    followChannel(!followChannel.value);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                      side: BorderSide(
                        color: Colors.green, // Green border color
                        width: 1.5, // Border width
                      ),
                    )),
                  ),
                  child: Text("Following",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold))))),
    ],
  ).paddingSymmetric(horizontal: 10, vertical: 12);
}
