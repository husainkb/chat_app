import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(BuildContext context, String message, {Color? bgColor, Color? textColor}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: bgColor ?? Theme.of(context).colorScheme.surface,
    textColor: textColor ?? Theme.of(context).colorScheme.onSurface,
    fontSize: 16.0,
  );
}
