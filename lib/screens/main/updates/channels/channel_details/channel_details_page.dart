
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

class ChannelsDetailsPage extends StatelessWidget {
  const ChannelsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isChatLock = true.obs;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverPersistentDelegate(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).customCardColor,
                  child: Column(
                    children: [
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
                          UserDetailsContainer(
                            title: "Audio",
                            icon: Icons.call_outlined,
                            iconSize: 22,
                          ),
                          UserDetailsContainer(
                            title: "Video",
                            icon: CupertinoIcons.video_camera,
                            iconSize: 25,
                          ),
                          UserDetailsContainer(
                            title: "Pay",
                            icon: Icons.currency_rupee_sharp,
                            iconSize: 22,
                          ),
                          UserDetailsContainer(
                            title: "Search",
                            icon: Icons.search,
                            iconSize: 22,
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 16,vertical: 10),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).customCardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Where there's a will, there's a way",
                        style: TextStyle(color: Theme.of(context).customText, fontSize: 14),
                      ),
                      Text("October 15, 2023",
                          style: TextStyle(
                              color: tealGreen,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ).paddingSymmetric(vertical: 10, horizontal: 16),
                ).paddingSymmetric(vertical: 8),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).customCardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Media, Links, and docs",
                                style: TextStyle(
                                    color: tealGreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text("25",
                                    style: TextStyle(
                                        color: tealGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))
                                    .paddingSymmetric(horizontal: 10),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: tealGreen,
                                )
                              ],
                            ),
                          ],
                        ).paddingSymmetric(vertical: 10,horizontal: 16),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    imgUserLogo,
                                    fit: BoxFit.cover,
                                    height: 95,
                                    width: 95,
                                  )).paddingSymmetric(horizontal: 5);
                            }),
                      ),

                    ],
                  ).paddingSymmetric(vertical: 10),
                ),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).customCardColor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.notifications_none,color: tealGreen,size: 26,).paddingOnly(right: 35),
                          Text(
                            "Notifications",
                            style: TextStyle(color: Theme.of(context).customText, fontSize: 16,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ).paddingAll(10),
                      Row(
                        children: [
                          Icon(Icons.photo_outlined,color: tealGreen,).paddingOnly(right: 35),
                          Text(
                            "Media visibility",
                            style: TextStyle(color: Theme.of(context).customText, fontSize: 16,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ).paddingAll(10),
                    ],
                  ).paddingAll(6),
                ).paddingSymmetric(vertical: 10),
                Container(
                  color: Theme.of(context).customCardColor,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.lock_outline,color: tealGreen,).paddingOnly(right: 20),
                        title: Text(
                          "Encryption",
                          style: TextStyle(color: Theme.of(context).customText, fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "Messages and calls are end-to-end encrypted. Tap to verify.",
                          style: TextStyle(color: tealGreen, fontSize: 13,fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.av_timer_outlined,color: tealGreen,).paddingOnly(right: 20),
                        title: Text(
                          "Disappearing messages",
                          style: TextStyle(color: Theme.of(context).customText, fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "off",
                          style: TextStyle(color: tealGreen, fontSize: 13,fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.mail_lock_outlined,color: tealGreen,).paddingOnly(right: 20),
                        title: Text(
                          "Chat lock",
                          style: TextStyle(color: Theme.of(context).customText, fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "Lock and hide this chat on this device.",
                          style: TextStyle(color: tealGreen, fontSize: 13,fontWeight: FontWeight.w500),
                        ),
                        trailing: Obx(()=>Switch(value: isChatLock.value,activeColor:blackColor ,activeTrackColor:Colors.green , onChanged: (val){
                          isChatLock(val);
                        }).paddingOnly(right: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).customCardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("No group in Common",
                          style: TextStyle(
                              color: tealGreen,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 18,
                              child: Icon(CupertinoIcons.person_2_alt,color: blackColor,size: 20,)).paddingOnly(right: 22),
                          Text(
                            "Create group with Samir Bante",
                            style: TextStyle(color: Theme.of(context).customText, fontSize: 16,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ).paddingSymmetric(vertical: 10),
                    ],
                  ).paddingSymmetric(horizontal: 16,vertical: 10),
                ).paddingSymmetric(vertical: 10),
                Container(
                  color: Theme.of(context).customCardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Icon(Icons.favorite_border,color: tealGreen,size: 20,).paddingOnly(right: 30,left: 10),
                          Text(
                            "Add to favorites",
                            style: TextStyle(color: Theme.of(context).customText, fontSize: 16,fontWeight: FontWeight.w500),
                          ),

                        ],
                      ).paddingSymmetric(vertical: 10),
                      Row(
                        children: [
                          Icon(Icons.photo_library_outlined,color: tealGreen,size: 20,).paddingOnly(right: 30,left: 10),
                          Text(
                            "Add to list",
                            style: TextStyle(color: Theme.of(context).customText, fontSize: 16,fontWeight: FontWeight.w500),
                          ),

                        ],
                      ).paddingSymmetric(vertical: 10),
                      Row(
                        children: [
                          Icon(Icons.block_flipped,color: Colors.red,size: 20,).paddingOnly(right: 30,left: 10),
                          Text(
                            "Block Martin Luther",
                            style: TextStyle(color: Colors.red, fontSize: 16,fontWeight: FontWeight.w500),
                          ),

                        ],
                      ).paddingSymmetric(vertical: 10),
                      Row(
                        children: [
                          Icon(Icons.thumb_down_alt_outlined,color: Colors.red,size: 20,).paddingOnly(right: 30,left: 10),
                          Text(
                            "Report Martin Luther",
                            style: TextStyle(color: Colors.red, fontSize: 16,fontWeight: FontWeight.w500),
                          ),

                        ],
                      ).paddingSymmetric(vertical: 10),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                ).paddingOnly(bottom: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SliverPersistentDelegate extends SliverPersistentHeaderDelegate {


  final double maxHeaderHeight = 180;
  final double minHeaderHeight = kToolbarHeight + 50;
  final double maxImageSize = 130;
  final double minImageSize = 40;

  SliverPersistentDelegate();
  void handleMenuSelection(String value) {
    switch (value) {
      case "Share":
      // Get.to(() => NewGroupPage());
        break;
      case "Edit":
      // Get.to(() => NewBroadCastPage());
        break;
      case "View in address book":
      // Get.to(() => LinkedDevicesPage());
        break;
      case "Verify Security Code":
      // Get.to(() => LinkedDevicesPage());
        break;
      default:
        print("Unknown action");
    }
  }

  var isChatLock = true.obs;
  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    final size = MediaQuery.of(context).size;
    final percent = shrinkOffset / (maxHeaderHeight - 35);
    final percent2 = shrinkOffset / (maxHeaderHeight);
    final currentImageSize = (maxImageSize * (1 - percent)).clamp(
      minImageSize,
      maxImageSize,
    );
    final currentImagePosition = ((size.width / 2 - 65) * (1 - percent)).clamp(
      minImageSize,
      maxImageSize,
    );
    return Container(
      color: Theme.of(context).customCardColor,
      child: Container(
        color: Theme.of(context)
            .appBarTheme
            .backgroundColor!
            .withOpacity(percent2 * 2 < 1 ? percent2 * 2 : 1),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 15,
              left: currentImagePosition + 50,
              child: Text(
                "Martin Luther",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(percent2),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: MediaQuery.of(context).viewPadding.top + 5,
              child: BackButton(
                color:
                percent2 > .3 ? Colors.white.withOpacity(percent2) : null,
              ),
            ),
            Positioned(
                right: 0,
                top: MediaQuery.of(context).viewPadding.top + 5,
                child: PopupMenuButton<String>(
                  iconColor:  percent2 > .3 ? Colors.white.withOpacity(percent2) : null,
                  color: tealGreen,
                  onSelected: (value) {
                    print("Selected: $value");
                    handleMenuSelection(value);
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: "Share",
                        child: Text(
                          "Share",
                          style: TextStyle(color: Colors.white),
                        )),
                    PopupMenuItem(
                      value: "Edit",
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    PopupMenuItem(
                        value: "View in address book",
                        child: Text(
                          "View in address book",
                          style: TextStyle(color: Colors.white),
                        )),
                    PopupMenuItem(
                        value: "Verify security code",
                        child: Text(
                          "Verify security code",
                          style: TextStyle(color: Colors.white),
                        )),

                  ],
                )
            ),
            Positioned(
              left: currentImagePosition,
              top: MediaQuery.of(context).viewPadding.top + 5,
              bottom: 0,
              child: Hero(
                tag: 'profile',
                child: Container(
                  width: currentImageSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imgUserLogo,),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeaderHeight;

  @override
  double get minExtent => minHeaderHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}


class UserDetailsContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;

  const UserDetailsContainer(
      {super.key,
        required this.title,
        required this.icon,
        required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 70,
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
