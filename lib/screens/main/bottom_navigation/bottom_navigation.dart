import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';
import 'package:whatsapp_clone/constants/controller_constants.dart';
import 'package:whatsapp_clone/screens/drawer/drawer.dart';
import 'package:whatsapp_clone/screens/main/calls/calls.dart';
import 'package:whatsapp_clone/screens/main/chats/chats.dart';
import 'package:whatsapp_clone/screens/main/communities/communities.dart';
import 'package:whatsapp_clone/screens/main/updates/updates.dart';
import 'package:whatsapp_clone/widgets/atoms/common_appbar.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ChatsPage(),
    const UpdatesPage(),
    const CommunitiesPage(),
    const CallsPage()
  ];

  void _onItemTapped(int index) {
    homeController.isSearch(false);
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => _onItemTapped(0),

              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                child: Icon(Icons.chat, color: _selectedIndex == 0 ? Colors.green : Colors.grey),
              ),
            ),
            IconButton(
              icon: Icon(Icons.update, color: _selectedIndex == 1 ? Colors.green : Colors.grey),
              onPressed: () => _onItemTapped(1),
            ),
            SizedBox(width: 40), // Space for FloatingActionButton
            IconButton(
              icon: Icon(Icons.group, color: _selectedIndex == 2 ? Colors.green : Colors.grey),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.call, color: _selectedIndex == 3 ? Colors.green : Colors.grey),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      appBar: commonAppbar(
        onPressed: (){
          _scaffoldKey.currentState?.openDrawer();
        },
        leadingIconColor: whiteColor,
        // leadingIconColor: Theme.of(context).customText,
        title: ["Chat App", "Updates", "Communities", "Calls"][_selectedIndex],
        textColor: Colors.white,
        actions: [
          // Obx(
          //       ()=> GestureDetector(
          //     child: Icon(themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode).paddingAll(6),
          //     onTap: () {
          //       themeController.toggleTheme();
          //       themeController.isDarkMode(Get.isDarkMode);
          //     },
          //   ),
          // ).paddingOnly(right: 4),
          Obx(
                ()=> _selectedIndex == 0?GestureDetector(
              child: Icon(homeController.isSearch.value ? Icons.close : Icons.search).paddingAll(6),
              onTap: () {
               homeController.isSearch(!homeController.isSearch.value);
              },
            ):SizedBox.shrink(),
          ),

        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        tooltip: ["New Chat", "New Status", "Add Community", "New Call"][_selectedIndex],
        child: Icon(
          [_selectedIndex == 0
              ? Icons.message
              : _selectedIndex == 1
              ? Icons.camera_alt:_selectedIndex ==2?Icons.add
              : Icons.add_call][0],
          color: Colors.black,
        ),
      ),
    );
  }
}
