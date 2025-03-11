import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/images_constants.dart';
import 'package:whatsapp_clone/themes/app_themes.dart';

PreferredSizeWidget commonAppbar(
    {required String title,
    bool centerTitle = false,
    Color? color,
      required Color leadingIconColor,
    Color? textColor = Colors.black,
      PreferredSizeWidget? widget,
      List<Widget>? actions,
      required onPressed
    }) {
  return AppBar(
    leading: IconButton(onPressed: onPressed, icon: Image.asset(icMenu,color: leadingIconColor,height: 22,)),
    scrolledUnderElevation: 0,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        title == "Chat App"?Hero(
          tag: "App_logo",
          child: Image.asset(imgAppLogo, height: 40,width: 40,),
        ):SizedBox.shrink(),
        Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ],
    ),
    bottom: widget,
    centerTitle: centerTitle,
    backgroundColor: color,
    actions: actions,
  );
}
