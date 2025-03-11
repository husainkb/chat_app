

import 'package:flutter/material.dart';

class ElevatedTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final double borderRadius;
  final Function() onPressed;
  const ElevatedTextButton({super.key, required this.text, required this.textColor, required this.buttonColor, required this.borderRadius, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(
            horizontal: 50, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }
}

class ElevatedIconButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final double borderRadius;
  final BorderSide? side;
  final Function() onPressed;
  const ElevatedIconButton({super.key, required this.text, required this.textColor, required this.buttonColor, required this.borderRadius, required this.onPressed, required this.icon, this.side = BorderSide.none});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon:icon,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
            side: side??BorderSide.none
        ),
      ),
      label: Text(
        text,
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }
}

