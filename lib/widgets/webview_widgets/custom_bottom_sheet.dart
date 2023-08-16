import 'package:flutter/material.dart';
import 'package:news_app/utils/functions/show_snackbar.dart';
import 'package:news_app/widgets/my_list_tile.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.controller,
  });
  final WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Container(
            width: 38.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          const Text(
            'More options',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Divider(),
          MyListTile(
            onTap: () => _reload(context),
            title: const Text('Refresh'),
            leadingIcon: Icons.refresh,
          ),
          MyListTile(
            onTap: () => _launchUrl(context),
            title: const Text('Open in borwser'),
            leadingIcon: Icons.open_in_browser_rounded,
          ),
          MyListTile(
            onTap: () => _shareUrl(context),
            title: const Text('Share'),
            leadingIcon: Icons.share,
          ),
        ],
      ),
    );
  }

  void _reload(BuildContext context) {
    controller.reload();
    Navigator.of(context).pop();
  }

  Future<void> _launchUrl(BuildContext context) async {
    try {
      await launchUrl(
        Uri.parse('https://flutter.dev'),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      Navigator.of(context).pop();

      showMySnackBar(
        context,
        content: 'Could not launch https://flutter.dev',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> _shareUrl(BuildContext context) async {
    try {
      await Share.share('https://flutter.dev');
    } catch (e) {
      Navigator.of(context).pop();
      showMySnackBar(
        context,
        content: 'Could not share url',
        backgroundColor: Colors.red,
      );
    }
  }
}
