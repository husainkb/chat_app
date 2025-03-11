import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/screens/main/updates/channels/all_channels/all_channels.dart';
import 'package:whatsapp_clone/screens/main/updates/channels/channel_chat/channel_chat.dart';
import 'package:whatsapp_clone/screens/main/updates/status/user_status.dart';
import 'package:whatsapp_clone/screens/main/updates/widgets.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.green,
        children: [

          SpeedDialChild(
            backgroundColor: Colors.green,
            child: Icon(Icons.broadcast_on_home,color: Colors.white,),
            label: 'Create Channel',
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CreateChannelScreen()),
              // );
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.purple,
            child: Icon(Icons.lock,color: Colors.white,),
            label: 'Status Privacy',
            onTap: () => print('Status Privacy'),
          ),
        ],
      ).paddingOnly(bottom: 100),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Status",
            //   style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //       color: Theme.of(context).customText),
            // ).paddingSymmetric(horizontal: 12, vertical: 12),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? addStatus(context: context, index: index,textColor:Theme.of(context).customText,bgColor:Theme.of(context).customBackground)
                        : InkWell(
                            onTap: () {
                              Get.to(()=>UserStatusPage());
                            },
                            child:
                                statusCard(context: context, index: index,textColor:Theme.of(context).customText,bgColor:Theme.of(context).customBackground));
                  }).paddingZero.marginZero,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Channels",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).customText),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => AllChannelsPage());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                        size: 13,
                      ).paddingOnly(left: 10)
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 12, vertical: 12),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 2, // Spacing between columns
                  mainAxisSpacing: 2,
                    childAspectRatio: 0.7
                  // Adjust for item size
                ),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Get.to(() => ChannelChatPage(index: index));
                      },
                      child: ChannelCard(stateContext: context, index: index));
                }),
            // Text(
            //   "Find Channels to Follow",
            //   style: TextStyle(
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold,
            //       color: tealGreen),
            // ).paddingSymmetric(horizontal: 12, vertical: 12),
            // ListView.builder(
            //     shrinkWrap: true,
            //     padding: EdgeInsets.zero,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //           onTap:  () {
            //             Get.to(() => ChannelChatPage());
            //           },
            //           child: channelFollowCard(context: context, index: index,textColor:Theme.of(context).customText,bgColor:Theme.of(context).customBackground));
            //     }).paddingZero,
            // SizedBox(
            //   height: 35,
            //   child: FilledButton(
            //     onPressed: () {
            //       Get.to(() => AllChannelsPage());
            //     },
            //     style: ButtonStyle(
            //       backgroundColor: WidgetStatePropertyAll(Colors.transparent),
            //       shape: WidgetStatePropertyAll(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30.0),
            //           // Rounded corners
            //           side: BorderSide(
            //             color: Colors.green, // Green border color
            //             width: 1, // Border width
            //           ),
            //         ),
            //       ),
            //     ),
            //     child: Text(
            //       "Explore more",
            //       style: TextStyle(
            //           color: Colors.green,
            //           fontSize: 12,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ).paddingAll(12)
          ],
        ).paddingOnly(bottom: 120),
      ),
    );
  }
}
