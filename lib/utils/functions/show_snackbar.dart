import 'package:flutter/material.dart';

showMySnackBar(
  BuildContext context, {
  required String content,
  Color? backgroundColor,
  Color contentColor = Colors.white,
}) {
  SnackBar snackBar = SnackBar(
    content: Text(
      content,
      style: TextStyle(color: contentColor),
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
