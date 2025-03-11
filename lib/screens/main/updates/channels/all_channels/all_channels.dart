import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/screens/main/updates/channels/channel_chat/channel_chat.dart';
import 'package:whatsapp_clone/screens/main/updates/widgets.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

class AllChannelsPage extends StatelessWidget {
  const AllChannelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title:  Text(
          "Channels",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap:  () {
                        Get.to(() => ChannelChatPage(index: index));
                      },
                      child: channelFollowCard(context: context, index: index,textColor:Theme.of(context).customText,bgColor:Theme.of(context).customBackground));
                })
          ],
        ),
      ),
    );
  }
}
