import 'package:flutter/material.dart';
import 'package:news_app/utils/functions/show_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlInBrowser(
  BuildContext context, {
  required String url,
}) async {
  try {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } catch (e) {
    Navigator.of(context).pop();

    showMySnackBar(
      context,
      content: 'Could not launch $url',
      backgroundColor: Colors.red,
    );
  }
}
