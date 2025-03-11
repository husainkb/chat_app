import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/screens/main/chats/chats_menu_pages/linked_devices/linked_devices.dart';
import 'package:whatsapp_clone/screens/main/chats/chats_menu_pages/new_broadcast/new_broadcast.dart';
import 'package:whatsapp_clone/screens/main/chats/chats_menu_pages/new_group/new_group.dart';
import 'package:whatsapp_clone/screens/main/chats/chats_menu_pages/payments/payments.dart';
import 'package:whatsapp_clone/screens/main/chats/users/user_chat.dart';
import 'package:whatsapp_clone/screens/main/chats/widgets.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';




class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> with TickerProviderStateMixin{
  late AnimationController _favoriteController;

  @override
  void initState() {
    super.initState();

    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

  }

  @override
  void dispose() {
    _favoriteController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.green,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        spacing: 10,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: Icon(Icons.group),
            label: "New Group",
            backgroundColor: Colors.green,
            onTap: () {
              Get.to(() => NewGroupPage());
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.campaign),
            label: "New Broadcast",
            backgroundColor: Colors.blue,
            onTap: () {
              Get.to(() => NewBroadCastPage());
            },
          ),
          // SpeedDialChild(
          //   child: Icon(Icons.campaign),
          //   label: "Test",
          //   backgroundColor: Colors.blue,
          //   onTap: () {
          //     Get.to(() => ProfilePage());
          //   },
          // ),
          SpeedDialChild(
            child: Icon(Icons.devices),
            label: "Linked Devices",
            backgroundColor: Colors.orange,
            onTap: () {
              Get.to(() => LinkedDevicesPage());
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.payment),
            label: "Payments",
            backgroundColor: Colors.purple,
            onTap: () {
              Get.to(() => PaymentsPage());
            },
          ),
        ],
      ).paddingOnly(bottom: 100),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,

      body: SingleChildScrollView(
        child: Column(
          children: [

            Obx(
              () => homeController.isSearch.value
                  ? Container(
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
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).customTextFieldHint,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          // No border
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ).paddingAll(10)
                  : SizedBox.shrink(),
            ),
            Obx(
              () => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Get.to(() => UserChatPage(),transition: Transition.leftToRightWithFade);
                            },
                            child: ChatCard(
                                context: context,
                                index: index,
                                textColor: Theme.of(context).customText));
                      })
                  .paddingOnly(
                      top: homeController.isSearch.value ? 0 : 10, bottom: 40),
            )
          ],
        ),
      ),
    );
  }
}
