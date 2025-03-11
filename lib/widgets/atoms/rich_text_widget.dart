
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final String linkText;
  final Function() onTap;
  const RichTextWidget({super.key, required this.text, required this.linkText, required this.onTap, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style:  TextStyle(color: textColor),
        children: [
          TextSpan(
            text: linkText,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onTap,
          ),
        ],
      ),
    );
  }
}