import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

class CallsDetailsPage extends StatelessWidget {
  const CallsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).customCardColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Call info",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).customCardColor,
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: 110,
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
                Text(
                  "Martin Luther",
                  style: TextStyle(
                      color: Theme.of(context).customText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ).paddingOnly(top: 10, bottom: 4),
                Text(
                  "+91 12345 67890",
                  style: TextStyle(
                      color: tealGreen,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserCallsDetailsContainer(
                      title: "Message",
                      icon: CupertinoIcons.chat_bubble_text,
                      iconSize: 22,
                    ),
                    UserCallsDetailsContainer(
                      title: "Audio",
                      icon: Icons.call_outlined,
                      iconSize: 22,
                    ),
                    UserCallsDetailsContainer(
                      title: "Video",
                      icon: CupertinoIcons.video_camera,
                      iconSize: 25,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16, vertical: 10),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Theme.of(context).customCardColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("February 18",
                    style: TextStyle(
                        color: tealGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)).paddingOnly(left: 16,top: 16),
                ListTile(
                  leading: Icon(CupertinoIcons.phone_fill_arrow_up_right,color: Colors.green,size: 26,),
                  title: Text("Outgoing",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  subtitle:Text("12:49 PM",
                      style: TextStyle(
                          color: tealGreen,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  trailing: Text("Not Answered",
                      style: TextStyle(
                          color: tealGreen,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                )
              ]),
            ).paddingOnly(top: 10),
          ),
        ],
      ),
    );
  }
}

class UserCallsDetailsContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;

  const UserCallsDetailsContainer(
      {super.key,
      required this.title,
      required this.icon,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: Get.width / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xff342631), // Change to your desired border color
          width: 2, // Change to your desired border width
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: greenColor,
            size: iconSize,
          ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).customText,
              fontSize: 14,
            ),
          )
        ],
      ),
    ).paddingAll(8);
  }
}
