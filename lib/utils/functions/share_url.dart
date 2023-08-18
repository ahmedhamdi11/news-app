import 'package:flutter/material.dart';
import 'package:news_app/utils/functions/show_snackbar.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareUrl(BuildContext context, {required String url}) async {
  try {
    await Share.share(url);
  } catch (e) {
    Navigator.of(context).pop();
    showMySnackBar(
      context,
      content: 'Could not share $url',
      backgroundColor: Colors.red,
    );
  }
}
