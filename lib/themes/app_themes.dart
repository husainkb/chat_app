import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors_constants.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: tealGreen,
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff0b1014),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );

}

extension ThemeExt on ThemeData {
  Color get customBackground => brightness == Brightness.dark ? Colors.black : Colors.white;
  Color get customText => brightness == Brightness.dark ? Colors.white : Colors.black;
  Color get customBottomNavInActiveIconColor => brightness == Brightness.dark ? Colors.white : Colors.grey;
  Color get customTextFieldBG => brightness == Brightness.dark ? grayColor : Colors.cyanAccent;
  Color get customTextFieldHint => brightness == Brightness.dark ? liteGrayColor : grayColor;
  Color get customDrawerBG => brightness == Brightness.dark ? Colors.black : tealGreen;
  Color get customCardColor => brightness == Brightness.dark?Color(0xff1e1f22) : Colors.white;
  }